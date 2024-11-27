Return-Path: <linux-renesas-soc+bounces-10716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 776ED9D9FE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 01:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FA341688CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 00:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09746ECF;
	Wed, 27 Nov 2024 00:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Ks+ko3AP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998CF442C;
	Wed, 27 Nov 2024 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732666070; cv=none; b=kugIJ4Y6c8eFtKF7/Y9bd+lFREtON54P7Kn55t4hGpMpIrsOVjK+wrd1KLLi2JjADxkBMrcj5ebM8GEw2nL6Dyk7wcSaqjsRn6g3/skqjuGnWsPL9IBqyuIou7r7x/i93yq7jXiYWNARNr1q7kWT9vtHdnepLlVOyeKkCmPXfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732666070; c=relaxed/simple;
	bh=b/bWXkWsBvIxxwjlVEAZG0qDiG7p+GKlNgmbj3amCsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=e5VIgzJmF8dsLYbVTFBSR6omrHhMwlGk9X32RMlHIyFUMxbMtZgBimQWY4I1pfxl8ykHAOYZ46vMQ2OloDGBQ2smYdjGmCN+e7ilyfc2XBDHsuFPo+/XJZRorfnO2WVAZrsHa640Epyil/tw+bmiJl8eqXqXHnaPx8FQDZloDEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Ks+ko3AP reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=7TYlHpIs5XZ2k0MiWJICOYJkAc8+riO3jFAfFvaZm+0=; b=K
	s+ko3APq25iudZkgfESUNBP9bHoUM2jgf5lf8J4YxY7k+1tFpp/wVMHvI0Xod+0P
	rc4MyeebDWXjF1b0X1KHoELd0A0EQ7Vho/RuPf3+5XfTViFHo1+k4MQ5dkE6/YeV
	5mZwqGf73jRvkRHbV+X2Bychz0a/8Qg5Qm3/epfTbI=
Received: from 00107082$163.com ( [111.35.188.140] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Wed, 27 Nov 2024 08:07:17 +0800
 (CST)
Date: Wed, 27 Nov 2024 08:07:17 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <875xo9zyeq.ffs@tglx>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org> <87ed36zon8.ffs@tglx>
 <25ddb2c9.4b0e.19347d04c05.Coremail.00107082@163.com> <875xo9zyeq.ffs@tglx>
X-NTES-SC: AL_Qu2YAPqduUgo4SOfbOkZnEYQheY4XMKyuPkg1YJXOp80siTd9ScBbW9EJHj6+s6LGzKhoAiNdBlF6P9nRYxdZ5K5+YgZ3rTouuDAjbUbrDsY
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <55ac03be.235.1936af19487.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgDXn9m2YkZndKQwAA--.57144W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hmjqmdGBiYiJgACsF
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjcgMDE6NDA6MjksICJUaG9tYXMgR2xlaXhuZXIiIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+T24gV2VkLCBOb3YgMjAgMjAyNCBhdCAxMjoyNCwgRGF2aWQgV2FuZyB3
cm90ZToKPj4gQXQgMjAyNC0xMS0yMCAwOToyMDo1OSwgIlRob21hcyBHbGVpeG5lciIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4+PmRpZmYgLS1naXQgYS9rZXJuZWwvaXJxL3Byb2MuYyBi
L2tlcm5lbC9pcnEvcHJvYy5jCj4+PmluZGV4IGYzNmMzM2JkMmRhNC4uOWI3MTVjZThjZjJlIDEw
MDY0NAo+Pj4tLS0gYS9rZXJuZWwvaXJxL3Byb2MuYwo+Pj4rKysgYi9rZXJuZWwvaXJxL3Byb2Mu
Ywo+Pj5AQCAtNTAxLDYgKzUwMSw3IEBAIGludCBzaG93X2ludGVycnVwdHMoc3RydWN0IHNlcV9m
aWxlICpwLCB2b2lkICp2KQo+Pj4gCj4+PiAJCXNlcV9wdXRfZGVjaW1hbF91bGxfd2lkdGgocCwg
IiAiLCBjbnQsIDEwKTsKPj4+IAl9Cj4+PisJc2VxX3B1dGMocCwgJyAnKTsKPj4+IAo+Pj4gCXJh
d19zcGluX2xvY2tfaXJxc2F2ZSgmZGVzYy0+bG9jaywgZmxhZ3MpOwo+Pj4gCWlmIChkZXNjLT5p
cnFfZGF0YS5jaGlwKSB7Cj4+Cj4+IE9uIHNlY29uZCB0aG91Z2h0LCAgIGNvbnNpZGVyaW5nIG90
aGVyIHBhdGhzIGhhdmUgYWxyZWFkeSBoYWQgYSBsZWFkaW5nIHNwYWNlLCAKPj4gbWF5YmUgaXQg
aXMgbW9yZSBjbGVhbiB0byBqdXN0IGFkZCBhIGxlYWRpbmcgc3BhY2UgYmVmb3JlIGlycV9wcmlu
dF9jaGlwOgo+Pgo+PiAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmZGVzYy0+bG9jaywg
ZmxhZ3MpOwo+PiAgICAgICAgIGlmIChkZXNjLT5pcnFfZGF0YS5jaGlwKSB7Cj4+IC0gICAgICAg
ICAgICAgICBpZiAoZGVzYy0+aXJxX2RhdGEuY2hpcC0+aXJxX3ByaW50X2NoaXApCj4+ICsgICAg
ICAgICAgICAgICBpZiAoZGVzYy0+aXJxX2RhdGEuY2hpcC0+aXJxX3ByaW50X2NoaXApIHsKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgc2VxX3B1dGMocCwgJyAnKTsKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgZGVzYy0+aXJxX2RhdGEuY2hpcC0+aXJxX3ByaW50X2NoaXAoJmRlc2MtPmly
cV9kYXRhLCBwKTsKPj4gLSAgICAgICAgICAgICAgIGVsc2UgaWYgKGRlc2MtPmlycV9kYXRhLmNo
aXAtPm5hbWUpCj4+ICsgICAgICAgICAgICAgICB9IGVsc2UgaWYgKGRlc2MtPmlycV9kYXRhLmNo
aXAtPm5hbWUpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wcmludGYocCwgIiAlOHMi
LCBkZXNjLT5pcnFfZGF0YS5jaGlwLT5uYW1lKTsKPj4gICAgICAgICAgICAgICAgIGVsc2UKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgc2VxX3ByaW50ZihwLCAiICU4cyIsICItIik7Cj4KPkkg
cmF0aGVyIGtlZXAgdGhlIHNlcV9wdXRjKCkgYW5kIHJlbW92ZSB0aGUgdHJhaWxpbmcgc3BhY2Ug
ZnJvbSB0aGUKPm90aGVyIHByaW50cy4KCkFncmVlLCAgY29kZSB3b3VsZCBhbGlnbiBiZXR0ZXIg
dGhpcyB3YXkgYW5kIHNlcGFyYXRpbmcgc3BhY2VzIHdpbGwgYmUgY29uc2lzdGVudC4KCkRhdmlk
CgoK

