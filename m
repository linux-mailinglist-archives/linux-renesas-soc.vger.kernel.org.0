Return-Path: <linux-renesas-soc+bounces-10610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA229D31ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 02:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51742B21DEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 01:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1B5AD55;
	Wed, 20 Nov 2024 01:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="aN1pUY09"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A78A848C;
	Wed, 20 Nov 2024 01:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732066615; cv=none; b=V9MGQlfrcKa6JoFjsZSBLr5Eney6HtTCaOOLq8vgb09ri09lLHCcsAc0+o5cadJZ9Bd90N/RHM6aUlRKvnhtQ3dcpZ1D9rwhdEZMWAlfZm+FeKyH16/FuNrVqqVYDr9SDWqGBwQZ+d1P59xpRWKztjXQ0CRVWWVys5z8yuux/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732066615; c=relaxed/simple;
	bh=GG+z9pAmRXfdNxrLP2FTDHvw6FKKz6b6Dh5l5Xi9d7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=VSsy3YsiBK4UMq/K6T931l2N4e3CtgTrz2ENUbs7q2Gp0w0vVix67kymKE843Hd0ecTU4jGTbHSNXIYgiKyMY7Tft8Y2aobs2S1mcFCecoAPqd/By9R9ebUneMGvzKwycS0l5bRZEOP4CCAPSkU/71T/Z4MshI1UAw4hG2Kw4b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=aN1pUY09 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=P+rOtps9eThkt6HJ6ka0iUVRO5YzMqf7103KEabcMMA=; b=a
	N1pUY09dbi+fiI773+9GDnx2D8q7qHgUunzt8hwAxp9Azdt2vhmGyBdeBot27ILh
	MTqht6SV7BnSDDXPo//lVcZRBVZ2kXOsevporJKFv6CuBuaPCloTv3dPv9wyR4U/
	wJ+Haq2dLE3VGAJFI1/K5leYqHib7dLrZ12MdFvNhw=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-126 (Coremail) ; Wed, 20 Nov 2024 09:36:26 +0800
 (CST)
Date: Wed, 20 Nov 2024 09:36:26 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <87ed36zon8.ffs@tglx>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org> <87ed36zon8.ffs@tglx>
X-NTES-SC: AL_Qu2YAPyduU0j4CaeYOkXn0oTju85XMCzuv8j3YJeN500lSTE1h0AbG5jHHbs9fmPKyqmoQmpYCJP1Pp/YJJgUaLmEKCMG2+nkKdShNLCeEDQ
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1e232e95.166d.1934736b02f.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:figvCgAXNHobPT1nDPAqAA--.19373W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMwqdqmc9OCEnGgAFs1
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjAgMDk6MjA6NTksICJUaG9tYXMgR2xlaXhuZXIiIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+T24gVHVlLCBOb3YgMTkgMjAyNCBhdCAyMDo1NSwgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOgo+PiBFLmcuIG9uIEtvZWxzY2ggKFItQ2FyIE0tVyksIHRoZSBvdXRwdXQg
Y2hhbmdlcyBmcm9tOgo+Pgo+PiAgCSAgICAgICBDUFUwICAgICAgIENQVTEKPj4gICAgICAgMjc6
ICAgICAgIDE4NzEgICAgICAgMjAxNyBHSUMtMCAgMjcgTGV2ZWwgICAgIGFyY2hfdGltZXIKPj4g
ICAgICAgMjk6ICAgICAgICA2NDYgICAgICAgICAgMCBHSUMtMCAyMDUgTGV2ZWwgICAgIGU2MGIw
MDAwLmkyYwo+PiAgICAgICAzMDogICAgICAgICAgMCAgICAgICAgICAwIEdJQy0wIDE3NCBMZXZl
bCAgICAgZmZjYTAwMDAudGltZXIKPj4gICAgICAgMzE6ICAgICAgICAgIDAgICAgICAgICAgMCBH
SUMtMCAgMzYgTGV2ZWwgICAgIGU2MDUwMDAwLmdwaW8KPj4gICAgICAgMzI6ICAgICAgICAgIDAg
ICAgICAgICAgMCBHSUMtMCAgMzcgTGV2ZWwgICAgIGU2MDUxMDAwLmdwaW8KPj4gICAgICAgWy4u
Ll0KPj4KPj4gdG8KPj4KPj4gIAkgICAgICAgQ1BVMCAgICAgICBDUFUxCj4+ICAgICAgIDI3OiAg
ICAgICAxOTY2ICAgICAgIDE5MDBHSUMtMCAgMjcgTGV2ZWwgICAgIGFyY2hfdGltZXIKPj4gICAg
ICAgMjk6ICAgICAgICA1ODAgICAgICAgICAgMEdJQy0wIDIwNSBMZXZlbCAgICAgZTYwYjAwMDAu
aTJjCj4+ICAgICAgIDMwOiAgICAgICAgICAwICAgICAgICAgIDBHSUMtMCAxNzQgTGV2ZWwgICAg
IGZmY2EwMDAwLnRpbWVyCj4+ICAgICAgIDMxOiAgICAgICAgICAwICAgICAgICAgIDBHSUMtMCAg
MzYgTGV2ZWwgICAgIGU2MDUwMDAwLmdwaW8KPj4gICAgICAgMzI6ICAgICAgICAgIDAgICAgICAg
ICAgMEdJQy0wICAzNyBMZXZlbCAgICAgZTYwNTEwMDAuZ3Bpbwo+PiAgICAgICBbLi4uXQo+Pgo+
PiBtYWtpbmcgdGhlIG91dHB1dCBoYXJkIHRvIHJlYWQsIGFuZCBwcm9iYWJseSBicmVha2luZyBz
Y3JpcHRzIHRoYXQgcGFyc2UKPj4gaXRzIGNvbnRlbnRzLgo+Pgo+PiBSZXZlcnRpbmcgdGhlIGNv
bW1pdCBmaXhlcyB0aGUgaXNzdWUgZm9yIG1lLgo+Cj5JbnRlcmVzdGluZ2x5IGVub3VnaCB0aGUg
Z2VuZXJpYyB2ZXJzaW9uIGFuZCBxdWl0ZSBzb21lIG9mIHRoZSBjaGlwCj5zcGVjaWZpYyBwcmlu
dCBmdW5jdGlvbnMgaGF2ZSBhIGxlYWRpbmcgc3BhY2UsIGJ1dCBHSUMgZG9lcyBub3QuCj4KPlRo
ZSBiZWxvdyBzaG91bGQgcmVzdG9yZSB0aGUgb3JpZ2luYWwgc3RhdGUuCj4KPlRoYW5rcywKPgo+
ICAgICAgICB0Z2x4Cj4tLS0KPmRpZmYgLS1naXQgYS9rZXJuZWwvaXJxL3Byb2MuYyBiL2tlcm5l
bC9pcnEvcHJvYy5jCj5pbmRleCBmMzZjMzNiZDJkYTQuLjliNzE1Y2U4Y2YyZSAxMDA2NDQKPi0t
LSBhL2tlcm5lbC9pcnEvcHJvYy5jCj4rKysgYi9rZXJuZWwvaXJxL3Byb2MuYwo+QEAgLTUwMSw2
ICs1MDEsNyBAQCBpbnQgc2hvd19pbnRlcnJ1cHRzKHN0cnVjdCBzZXFfZmlsZSAqcCwgdm9pZCAq
dikKPiAKPiAJCXNlcV9wdXRfZGVjaW1hbF91bGxfd2lkdGgocCwgIiAiLCBjbnQsIDEwKTsKPiAJ
fQo+KwlzZXFfcHV0YyhwLCAnICcpOwo+IAo+IAlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmRlc2Mt
PmxvY2ssIGZsYWdzKTsKPiAJaWYgKGRlc2MtPmlycV9kYXRhLmNoaXApIHsKCkxHVE0uCgpBY2tl
ZC1ieTogIERhdmlkIFdhbmcgPDAwMTA3MDgyQDE2My5jb20+CgoKVGhhbmtzCkRhdmlkCgo=

