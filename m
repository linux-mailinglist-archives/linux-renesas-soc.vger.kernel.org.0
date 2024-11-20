Return-Path: <linux-renesas-soc+bounces-10612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A223F9D320E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 03:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13321B20E53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 02:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9162680027;
	Wed, 20 Nov 2024 02:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="n3uIpU2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B04F49625;
	Wed, 20 Nov 2024 02:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732068535; cv=none; b=SJ6sxvnr0zXBzToAUm4WdH/cCHkM2Nw7jOfUj3AZSwmRery3orgEgU54G6Rk6Xp/UThxVSknN7pInly0jezkyUIS3vsswS6D6ZXwRxYwvQW/gzQr9bD4IUeJ6f7nnU4V+B8phGleLh4my1hQPqQmzK7HDb448iijZKpOhxTHzt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732068535; c=relaxed/simple;
	bh=Y58khBAMXeHrblKTVEPTcEqUmHHRfOuILFvUqqcg6EQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ltNHn7GBi/CHl7DyiEsTx0MwILoTAHrk5reVvpA8//PHL+O/AN3Yuh2M6iZVNYoq4EVn3kTQMeDna8ZnfHJMIvkiUktrUaOf+T2lg7b6Zc7F8nsms25B+ZwzX0rIhgi+BQzj7R5YjzGuFqf0KXPZ0ODp9cNyA9iPPFKNf5GJiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=n3uIpU2j reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=5fYSbO2jRCD4gf76i3NYUh0dprTYyDwyo4UyX7S3QZw=; b=n
	3uIpU2j/6uVUmPDkr/la3vRf4PNC6pkJcMQ5s2iC2K4af6cnadK0Gt4XVh45dRFf
	NnHcDFTcUQOlLJSllzsVEFs3KcTXcSgybl+v0o8fja/HiVVP4zCK3tHG7Yz60IFc
	QnpkDhKqHwacJfY7N2uAyMgRC6puP6yf5GsucpvpTE=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Wed, 20 Nov 2024 10:08:32 +0800
 (CST)
Date: Wed, 20 Nov 2024 10:08:32 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <5ed0a36f.1698.1934737447d.Coremail.00107082@163.com>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <5ed0a36f.1698.1934737447d.Coremail.00107082@163.com>
X-NTES-SC: AL_Qu2YAPydt00q5CadZ+kZnEYQheY4XMKyuPkg1YJXOp80mCTz+yYsbG5EIHbs9fmWEhCmoQmecARj08ZWZrlkdZNO5hxNr3FIqMzEMN2ObQuy
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <710d6832.1f29.19347541394.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgBX_jShRD1nXSIrAA--.14446W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMwqdqmc9OCEnGgAJs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjAgMDk6Mzc6MDQsICJEYXZpZCBXYW5nIiA8MDAxMDcwODJAMTYzLmNvbT4g
d3JvdGU6Cj5IaSwgCj5BdCAyMDI0LTExLTIwIDAzOjU1OjMwLCAiR2VlcnQgVXl0dGVyaG9ldmVu
IiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+PiAJSGkgRGF2aWQsCj4+Cj4+T24gU2F0
LCA5IE5vdiAyMDI0LCBEYXZpZCBXYW5nIHdyb3RlOgo+Pj4gc2VxX3ByaW50ZigpIGlzIGNvc3R5
LCBvbiBhIHN5c3RlbSB3aXRoIG0gaW50ZXJydXB0cyBhbmQgbiBDUFVzLCB0aGVyZQo+Pj4gd291
bGQgYmUgbSpuIGRlY2ltYWwgdmFsdWVzIHlpZWxkIHZpYSBzZXFfcHJpbnRmKCkgd2hlbiByZWFk
aW5nCj4+PiAvcHJvYy9pbnRlcnJ1cHRzLCB0aGUgY29zdCBwYXJzaW5nIGZvcm1hdCBzdHJpbmdz
IGdyb3dzIHdpdGggbnVtYmVyIG9mCj4+PiBDUFUuIFByb2ZpbGluZyBvbiBhIHg4NiA4LWNvcmUg
c3lzdGVtIGluZGljYXRlcyBzZXFfcHJpbnRmKCkgdGFrZXMgfjQ3JQo+Pj4gc2FtcGxlcyBvZiBz
aG93X2ludGVycnVwdHMoKSwgYW5kIHJlcGxhY2Ugc2VxX3ByaW50ZigpIHdpdGgKPj4+IHNlcV9w
dXRfZGVjaW1hbF91bGxfd2lkdGgoKSBjb3VsZCBoYXZlIG5lYXIgMzAlIHBlcmZvcm1hbmNlIGdh
aW4uCj4+Pgo+Pj4gVGhlIGltcHJvdmVtZW50IGhhcyBwcmF0aWNhbCBzaWduaWZpY2FuY2UsIGNv
bnNpZGVyaW5nIG1hbnkgbW9uaXRvcmluZwo+Pj4gdG9vbHMgd291bGQgcmVhZCAvcHJvYy9pbnRl
cnJ1cHRzIHBlcmlvZGljYWxseS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXYW5nIDww
MDEwNzA4MkAxNjMuY29tPgo+Pgo+PlRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93
IGNvbW1pdCBmOWVkMWY3YzJlMjZmY2QxCj4+KCJnZW5pcnEvcHJvYzogVXNlIHNlcV9wdXRfZGVj
aW1hbF91bGxfd2lkdGgoKSBmb3IgZGVjaW1hbCB2YWx1ZXMiKQo+PmluIGlycWNoaXAvaXJxL2Nv
cmUuCj4+Cj4+VGhpcyByZW1vdmVzIGEgc3BhY2UgYWZ0ZXIgdGhlIGxhc3QgQ1BVIGNvbHVtbiwg
Y2F1c2luZyB0aGUgdmFsdWVzIGluCj4+dGhpcyBjb2x1bW4gdG8gYmUgY29uY2F0ZW5hdGVkIHRv
IHRoZSB2YWx1ZXMgaW4gdGhlIG5leHQgY29sdW1uLgo+Pgo+PkUuZy4gb24gS29lbHNjaCAoUi1D
YXIgTS1XKSwgdGhlIG91dHB1dCBjaGFuZ2VzIGZyb206Cj4+Cj4+IAkgICAgICAgQ1BVMCAgICAg
ICBDUFUxCj4+ICAgICAgMjc6ICAgICAgIDE4NzEgICAgICAgMjAxNyBHSUMtMCAgMjcgTGV2ZWwg
ICAgIGFyY2hfdGltZXIKPj4gICAgICAyOTogICAgICAgIDY0NiAgICAgICAgICAwIEdJQy0wIDIw
NSBMZXZlbCAgICAgZTYwYjAwMDAuaTJjCj4+ICAgICAgMzA6ICAgICAgICAgIDAgICAgICAgICAg
MCBHSUMtMCAxNzQgTGV2ZWwgICAgIGZmY2EwMDAwLnRpbWVyCj4+ICAgICAgMzE6ICAgICAgICAg
IDAgICAgICAgICAgMCBHSUMtMCAgMzYgTGV2ZWwgICAgIGU2MDUwMDAwLmdwaW8KPj4gICAgICAz
MjogICAgICAgICAgMCAgICAgICAgICAwIEdJQy0wICAzNyBMZXZlbCAgICAgZTYwNTEwMDAuZ3Bp
bwo+PiAgICAgIFsuLi5dCj4+Cj4+dG8KPj4KPj4gCSAgICAgICBDUFUwICAgICAgIENQVTEKPj4g
ICAgICAyNzogICAgICAgMTk2NiAgICAgICAxOTAwR0lDLTAgIDI3IExldmVsICAgICBhcmNoX3Rp
bWVyCj4+ICAgICAgMjk6ICAgICAgICA1ODAgICAgICAgICAgMEdJQy0wIDIwNSBMZXZlbCAgICAg
ZTYwYjAwMDAuaTJjCj4+ICAgICAgMzA6ICAgICAgICAgIDAgICAgICAgICAgMEdJQy0wIDE3NCBM
ZXZlbCAgICAgZmZjYTAwMDAudGltZXIKPj4gICAgICAzMTogICAgICAgICAgMCAgICAgICAgICAw
R0lDLTAgIDM2IExldmVsICAgICBlNjA1MDAwMC5ncGlvCj4+ICAgICAgMzI6ICAgICAgICAgIDAg
ICAgICAgICAgMEdJQy0wICAzNyBMZXZlbCAgICAgZTYwNTEwMDAuZ3Bpbwo+PiAgICAgIFsuLi5d
Cj4+Cj4+bWFraW5nIHRoZSBvdXRwdXQgaGFyZCB0byByZWFkLCBhbmQgcHJvYmFibHkgYnJlYWtp
bmcgc2NyaXB0cyB0aGF0IHBhcnNlCj4+aXRzIGNvbnRlbnRzLgo+Cj5UaGFua3MgZm9yIHJlcG9y
dGluZyB0aGlzLCBJIHdhcyBjb25zaWRlcmluZyB0aGUgc3BhY2VzIGFuZCBjaGVja2VkIGl0IG9u
IG15IHN5c3RlbSwKPkkgdGhvdWdodCAiYWxsIiBkZXNjcmlwdGlvbnMgaGF2ZSBsZWFkaW5nIHNw
YWNlcyBhbmQgaXQncyBvayB0byByZW1vdmUgdGhlIGV4dHJhIG9uZS4KPkJ1dCBJIGRpZCBub3Qg
Y2hlY2sgYWxsIHRoZSAiaXJxX3ByaW50X2NoaXAiIGNvZGVzLCBub3cgd2hlbgo+Y2hlY2tpbmcg
dGhlIGNvZGUsIHRoZXJlIGFyZSBtYW55IEdQSU8gZHJpdmVycycgaW1wbGVtZW50YXRpb25zIHdp
dGggbm8gbGVhZGluZyBzcGFjZXMuCj4oVGhlIGJlaGF2aW9yIGlzIG5vdCBjb25zaXN0ZW50IGNy
b3NzICBkcml2ZXIgaW1wbGVtZW50YXRpb25zIHRob3VnaC4uLikKClNldmVyYWwgZHJpdmVycyB1
c2UgZGV2X25hbWUgYXMgZm9ybWF0IHN0cmluZyBmb3Igc2VxX3ByaW50ZiwgIHdvdWxkIHRoaXMg
cmFpc2Ugc2VjdXJpdHkgY29uY2VybnM/CgogICAgICAgZHJpdmVycy9ncGlvL2dwaW8teGdzLWlw
cm9jLmM6CXNlcV9wcmludGYocCwgZGV2X25hbWUoY2hpcC0+ZGV2KSk7CiAgICAgICAgZHJpdmVy
cy9ncGlvL2dwaW8tbWx4YmYyLmM6CXNlcV9wcmludGYocCwgZGV2X25hbWUoZ3MtPmRldikpOwog
ICAgICAgIGRyaXZlcnMvZ3Bpby9ncGlvLW9tYXAuYzoJc2VxX3ByaW50ZihwLCBkZXZfbmFtZShi
YW5rLT5kZXYpKTsKICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby1obHdkLmM6CXNlcV9wcmludGYo
cCwgZGV2X25hbWUoaGx3ZC0+ZGV2KSk7CiAgICAgICAgZHJpdmVycy9ncGlvL2dwaW8tYXNwZWVk
LmM6CXNlcV9wcmludGYocCwgZGV2X25hbWUoZ3Bpby0+ZGV2KSk7CiAgICAgICAgZHJpdmVycy9n
cGlvL2dwaW8tcGNhOTUzeC5jOglzZXFfcHJpbnRmKHAsIGRldl9uYW1lKGdjLT5wYXJlbnQpKTsK
ICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby10ZWdyYTE4Ni5jOglzZXFfcHJpbnRmKHAsIGRldl9u
YW1lKGdjLT5wYXJlbnQpKTsKICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby10ZWdyYS5jOglzZXFf
cHJpbnRmKHMsIGRldl9uYW1lKGNoaXAtPnBhcmVudCkpOwogICAgICAgIGRyaXZlcnMvZ3Bpby9n
cGlvLWVwOTN4eC5jOglzZXFfcHJpbnRmKHAsIGRldl9uYW1lKGdjLT5wYXJlbnQpKTsKICAgICAg
ICBkcml2ZXJzL2dwaW8vZ3Bpby1hc3BlZWQtc2dwaW8uYzoJc2VxX3ByaW50ZihwLCBkZXZfbmFt
ZShncGlvLT5kZXYpKTsKICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby1wbDA2MS5jOglzZXFfcHJp
bnRmKHAsIGRldl9uYW1lKGdjLT5wYXJlbnQpKTsKICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby12
aXNjb250aS5jOglzZXFfcHJpbnRmKHAsIGRldl9uYW1lKHByaXYtPmRldikpOwoKCj4KPlNvcnJ5
IGZvciB0aGUgcmVncmVzc2lvbiwgYW5kIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4KPgo+Cj5E
YXZpZAoKRGF2aWQ=

