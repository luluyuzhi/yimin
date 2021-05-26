---
# try also 'default' to start simple
theme: seriph
# random image from a curated Unsplash collection by Anthony
# like them? see https://unsplash.com/collections/94734566/slidev
background: https://source.unsplash.com/collection/94734566/1920x1080
# apply any windi css classes to the current slide
class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# some information about the slides, markdown enabled
info: |
  ## rust 特性介绍
---

# Rust 特性详解

---

# 变量和可变性

让我们从两条赋值语句开始：

【1】
```rust {monaco}
fn main () {
  let youdao = "jingpinke";
  youdao = "xiaobanke";
}

```

【2】

```rust {monaco}
#![allow(unused)]
#![allow(const_item_mutation)]
struct BookInfo( i32, f32 ); //元组结构体
fn main() {
  let bi:BookInfo =BookInfo(1, 2.0);
  bi.1 =3.0;
}
```

---

# 变量和可变性

恭喜你，获得了两条错误。

```rust
let youdao = "jingpinke";
|     ------
|     |
|     first assignment to `youdao`
|     help: make this binding mutable: `mut youdao`
   youdao = "xiaobanke";
| ^^^^^^^^^^^^^^^^^^^^ cannot assign twice to immutable variable
```



```rust {5,7}}
#![allow(unused)]
#![allow(const_item_mutation)]
struct BookInfo( i32, f32 ); //元组结构体
fn main() {
  let bi:BookInfo =BookInfo(1, 2.0);
  bi.1 =3.0; // error[E0594]: cannot assign to `bi.1`, as `bi` is not declared as mutable
}
```

---

# 变量和可变性

在Rust 中变量默认是不可改变的（immutable）也就是说当我们声明一个变量的时候, 我们不可以对它重新赋值，如果我们想对它重新赋值 我们应该对它添加 `mut`
关键字。

这样做有什么好处：

1. 默认的不可变让程序员强制思考（对公司友好）🤞
2. 默认的不可变让编译器易于追踪代码，从而使得代码易于推导（编译器友好）🤞
3. mut 向读者表明了其他代码将会改变这个变量值的意图（阅读友好）🤞

没错，哪里都好。😘

嗯……就是对使用者不友好。😒
---

# 变量和可变性

rust 的可变性/不可变性，会让人想起 其他语言的 const 常量。嗯，有点像，我们来进行一下对比：

<div grid="~ cols-2 gap-2" m="-t-2">
  
```javascript
// const 常量
const a = {};
Object.defineProperties(a, {
  'property1': {
    value: true,
    writable: true
  },
  'property2': {
    value: 'Hello',
    writable: false
});
a.property1 =1;
a = {};
//Eror: Uncaught TypeError:
// Assignment to constant variable. at <anonymous>:1:3
```
```cpp
const A *pca1 = new A; 
A *pa2 = const_cast<A*>(pca1);  
pa2->m_iNum = 200;    //fine
```

</div>

---

# 变量和可变性

MDN 中 const 定义：

MDN: 在javascuript 中 `const` 声明一个只读的常量，一旦声明,常量的**值**就不能改了。
因此被const 修饰的变量名，不可重新赋值，但内部的成员属性却还可以修改

##### 在 c/c++ 就复杂了很多：

在 c++ 中 又引入了`constexpr`关键字 来表示编译期常量，`const` 在`c++`中又称为运行期常量。
同样的在 c++ 与 c语言const的对比中 const 又有真常量，假常量之说。

在 c++ 中 `const` 被赋予更多的意义，同时也具有不可变性的含义。记得 `mutable` 这个关键字嘛？

---

# 常量

```rust
const MAX_POINTS: u32 = 100_000;
```


```rust
#![allow(unused)]
#![allow(const_item_mutation)]
struct BookInfo( i32, f32 ); //元组结构体
fn main() {
const BI : BookInfo = BookInfo(1, 2.0);
	BI.1 = 3.0;
	let nn = 2;
	const BII:BookInfo = BookInfo(nn, 2.0);
        print!("{}", BI.1); // print :  2
}
```
1. 不允许对常量使用 `mut`。常量不光默认不能变，它总是不能变（总是不能变？）。
2. 常量只能被设置为常量表达式，而不能是函数调用的结果（类似 c++ 的 constexpr），或任何其他只能在运行时计算出的值。
（按照推理来说 被 const 修饰的常量应该存在于**常量区**）
注： *声明const 的变量必须标注 类型名*

这么一看 被 `let`修饰的 变量 和被 `const` 修饰的常量好像也没有什么太大的区别。

---

# 隐藏（Shadowing） 
- `let`的遮蔽性

 ```rust {monaco}
fn main() {
    let x = 5;
    let x = x + 1;
    let x = x * 2;
    println!("The value of x is: {}", x);
}
 ```

<!--
隐藏与将变量标记为 mut 是有区别的。

 1. 当不小心尝试对变量重新赋值时，如果没有使用 let 关键字，就会导致编译时错误。通过使用 let，我们可以用这个值进行一些计算，不过计算完之后变量仍然是不变的。
 2. mut 与隐藏的另一个区别是，当再次使用 let 时，实际上创建了一个新变量，我们可以改变值的类型，但复用这个名字。例如，假设程序请求用户输入空格字符来说明希望在文本之间显示多少个空格，然而我们真正需要的是将输入存储成数字（多少个空格）
-->

---
