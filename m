Return-Path: <linux-renesas-soc+bounces-10613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A99859D32E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 05:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B07CB20EFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 04:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C398615A;
	Wed, 20 Nov 2024 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="lL4gVsiO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E567E40BE5;
	Wed, 20 Nov 2024 04:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732076671; cv=none; b=mi62gnJ6gsJ0YQP6as7tH6T7TMmNC4kag0rIpb9cQ9JqyEVH7bW4RSr7/ZGo21+VQWTgDcA50d9d2KFmPoY4FIPij/qtac+0XuzeJ3WWBHClSz7qV8NePDdp351TkWEnOFU8PA0cEGo6r53hY818XBOn4xHCjzna0au5RCch3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732076671; c=relaxed/simple;
	bh=ipUbqf8QDOA0oz7wtbJTOcajGROMBz6E+cF/cBrZI2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=g8mPJPtF1NP2kkDoywL6AempMLqetEhqvB8f++ilNc+gfaZyOVatbp1jj+I20VNFRjPhz5WjqPJH+tEWWroLy2KJVGJp52iTpfBuKPtKFHrcB/CmI9+ZFviLF7qKnTXRPEG7YX5I9gAkxj8goys1iLHj7mEzZd/TqXpNQ4j2r/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=lL4gVsiO reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=UcpYERVM16BjhLTxHXglpegcmBwAZwFWWDL500Qf2X8=; b=l
	L4gVsiOa7NWrrDYVPIXR6KEkWl4B6C+gWCmDC7qkYatPKjqJ3tybxE6GxIlYV/Gy
	ViuQYeRJ2Dajk0mFqZP1qvYnSFY4m3G49+4tbHaFN8INk0smkIcup9TgNVzvL0H/
	Ujl3GlEPfoGns03zTpb+iJP86kvRgI+bFYQFUFByEo=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Wed, 20 Nov 2024 12:24:13 +0800
 (CST)
Date: Wed, 20 Nov 2024 12:24:13 +0800 (CST)
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
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <87ed36zon8.ffs@tglx>
X-NTES-SC: AL_Qu2YAPycuU4u5SWeY+kXn0oTju85XMCzuv8j3YJeN500iiXP0C0bcnBdGnjV4sO0CiCSvxeTTiFs0cV8WKZybabEqI3pEuR2sWp415XB6+1u
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <25ddb2c9.4b0e.19347d04c05.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iSgvCgD3v6huZD1nQ2UrAA--.57786W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMwqdqmc9OCEnGgAMs8
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
PmxvY2ssIGZsYWdzKTsKPiAJaWYgKGRlc2MtPmlycV9kYXRhLmNoaXApIHsKCk9uIHNlY29uZCB0
aG91Z2h0LCAgIGNvbnNpZGVyaW5nIG90aGVyIHBhdGhzIGhhdmUgYWxyZWFkeSBoYWQgYSBsZWFk
aW5nIHNwYWNlLCAKbWF5YmUgaXQgaXMgbW9yZSBjbGVhbiB0byBqdXN0IGFkZCBhIGxlYWRpbmcg
c3BhY2UgYmVmb3JlIGlycV9wcmludF9jaGlwOgoKICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsKICAgICAgICBpZiAoZGVzYy0+aXJxX2RhdGEuY2hpcCkg
ewotICAgICAgICAgICAgICAgaWYgKGRlc2MtPmlycV9kYXRhLmNoaXAtPmlycV9wcmludF9jaGlw
KQorICAgICAgICAgICAgICAgaWYgKGRlc2MtPmlycV9kYXRhLmNoaXAtPmlycV9wcmludF9jaGlw
KSB7CisgICAgICAgICAgICAgICAgICAgICAgIHNlcV9wdXRjKHAsICcgJyk7CiAgICAgICAgICAg
ICAgICAgICAgICAgIGRlc2MtPmlycV9kYXRhLmNoaXAtPmlycV9wcmludF9jaGlwKCZkZXNjLT5p
cnFfZGF0YSwgcCk7Ci0gICAgICAgICAgICAgICBlbHNlIGlmIChkZXNjLT5pcnFfZGF0YS5jaGlw
LT5uYW1lKQorICAgICAgICAgICAgICAgfSBlbHNlIGlmIChkZXNjLT5pcnFfZGF0YS5jaGlwLT5u
YW1lKQogICAgICAgICAgICAgICAgICAgICAgICBzZXFfcHJpbnRmKHAsICIgJThzIiwgZGVzYy0+
aXJxX2RhdGEuY2hpcC0+bmFtZSk7CiAgICAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAg
ICAgICAgICAgIHNlcV9wcmludGYocCwgIiAlOHMiLCAiLSIpOwoKCgpEYXZpZA==

