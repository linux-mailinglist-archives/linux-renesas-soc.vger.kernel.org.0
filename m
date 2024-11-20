Return-Path: <linux-renesas-soc+bounces-10611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B89D31EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 02:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ABAE1F23ACF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 01:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6A848C;
	Wed, 20 Nov 2024 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="cn1paUhB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C774A1B7F4;
	Wed, 20 Nov 2024 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732066643; cv=none; b=l1cQCA7uqAC5Hp2CplSfFxi7hRZTArjCSh6gR3dE+7Q8Sb0nRYn18TOj3LL3b2V9C6b7opY2HBIAtvT467maIfdmNvhkCDzQUya3jopt/MLmzvIfWYiw1HCiGZ9WtnhgRJECk/r/2gXdEfJhbDWDM7CTnTQ+sXNrMXo4H11JzZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732066643; c=relaxed/simple;
	bh=AR0zTTaKPVB3v689Jt542zH6lauMwz7Nz7qpbemr6Dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=W3KR2l9vXIwbJmLTfDxIy6R8TSjzRUGYeCNdfCOMXo4N+6rzSLqHUskco9Af+haXALibhd8gb+ggd7MZs+FCnhiR18e9LvYGpTbs80pHEHVs4x1JaUivEN70Jz3/aXY5YMFO6SOVoVGtDliRzo1hu/LmM2hYisGtbwxRVwwv1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=cn1paUhB reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=i2KCmJeVY34aLjQElsTrG0lHnE6STYcH7gUXmFNe8No=; b=c
	n1paUhBJ6SwwY9Xx8MLOTqJa8GaI4BwXHIwQE5LGqgTD7+5nWWoi22u7Z6RXb/bL
	+m5XXY1ke+sqKl4EZFt8XE/3S6DY52I1GymFwVzs9+6B8YS3tOL85LHonm+xZDtA
	AW14/eXoT1y3SUs83VhxCuuZ/4uRUufHxBfcPfISzQ=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-126 (Coremail) ; Wed, 20 Nov 2024 09:37:04 +0800
 (CST)
Date: Wed, 20 Nov 2024 09:37:04 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
X-NTES-SC: AL_Qu2YAPyduU4p4iabZukXn0oTju85XMCzuv8j3YJeN500lSTE1h0AbG5jHHbs9fmPKyqmoQmpYCJP1Pp/YJJgUaIDoOeIWDaNWHG9s1hCA9aa
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5ed0a36f.1698.1934737447d.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:figvCgD3n51APT1nTPAqAA--.23275W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMwqdqmc9OCEnGgAGs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksIApBdCAyMDI0LTExLTIwIDAzOjU1OjMwLCAiR2VlcnQgVXl0dGVyaG9ldmVuIiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IAlIaSBEYXZpZCwKPgo+T24gU2F0LCA5IE5vdiAyMDI0
LCBEYXZpZCBXYW5nIHdyb3RlOgo+PiBzZXFfcHJpbnRmKCkgaXMgY29zdHksIG9uIGEgc3lzdGVt
IHdpdGggbSBpbnRlcnJ1cHRzIGFuZCBuIENQVXMsIHRoZXJlCj4+IHdvdWxkIGJlIG0qbiBkZWNp
bWFsIHZhbHVlcyB5aWVsZCB2aWEgc2VxX3ByaW50ZigpIHdoZW4gcmVhZGluZwo+PiAvcHJvYy9p
bnRlcnJ1cHRzLCB0aGUgY29zdCBwYXJzaW5nIGZvcm1hdCBzdHJpbmdzIGdyb3dzIHdpdGggbnVt
YmVyIG9mCj4+IENQVS4gUHJvZmlsaW5nIG9uIGEgeDg2IDgtY29yZSBzeXN0ZW0gaW5kaWNhdGVz
IHNlcV9wcmludGYoKSB0YWtlcyB+NDclCj4+IHNhbXBsZXMgb2Ygc2hvd19pbnRlcnJ1cHRzKCks
IGFuZCByZXBsYWNlIHNlcV9wcmludGYoKSB3aXRoCj4+IHNlcV9wdXRfZGVjaW1hbF91bGxfd2lk
dGgoKSBjb3VsZCBoYXZlIG5lYXIgMzAlIHBlcmZvcm1hbmNlIGdhaW4uCj4+Cj4+IFRoZSBpbXBy
b3ZlbWVudCBoYXMgcHJhdGljYWwgc2lnbmlmaWNhbmNlLCBjb25zaWRlcmluZyBtYW55IG1vbml0
b3JpbmcKPj4gdG9vbHMgd291bGQgcmVhZCAvcHJvYy9pbnRlcnJ1cHRzIHBlcmlvZGljYWxseS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgV2FuZyA8MDAxMDcwODJAMTYzLmNvbT4KPgo+VGhh
bmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGY5ZWQxZjdjMmUyNmZjZDEK
PigiZ2VuaXJxL3Byb2M6IFVzZSBzZXFfcHV0X2RlY2ltYWxfdWxsX3dpZHRoKCkgZm9yIGRlY2lt
YWwgdmFsdWVzIikKPmluIGlycWNoaXAvaXJxL2NvcmUuCj4KPlRoaXMgcmVtb3ZlcyBhIHNwYWNl
IGFmdGVyIHRoZSBsYXN0IENQVSBjb2x1bW4sIGNhdXNpbmcgdGhlIHZhbHVlcyBpbgo+dGhpcyBj
b2x1bW4gdG8gYmUgY29uY2F0ZW5hdGVkIHRvIHRoZSB2YWx1ZXMgaW4gdGhlIG5leHQgY29sdW1u
Lgo+Cj5FLmcuIG9uIEtvZWxzY2ggKFItQ2FyIE0tVyksIHRoZSBvdXRwdXQgY2hhbmdlcyBmcm9t
Ogo+Cj4gCSAgICAgICBDUFUwICAgICAgIENQVTEKPiAgICAgIDI3OiAgICAgICAxODcxICAgICAg
IDIwMTcgR0lDLTAgIDI3IExldmVsICAgICBhcmNoX3RpbWVyCj4gICAgICAyOTogICAgICAgIDY0
NiAgICAgICAgICAwIEdJQy0wIDIwNSBMZXZlbCAgICAgZTYwYjAwMDAuaTJjCj4gICAgICAzMDog
ICAgICAgICAgMCAgICAgICAgICAwIEdJQy0wIDE3NCBMZXZlbCAgICAgZmZjYTAwMDAudGltZXIK
PiAgICAgIDMxOiAgICAgICAgICAwICAgICAgICAgIDAgR0lDLTAgIDM2IExldmVsICAgICBlNjA1
MDAwMC5ncGlvCj4gICAgICAzMjogICAgICAgICAgMCAgICAgICAgICAwIEdJQy0wICAzNyBMZXZl
bCAgICAgZTYwNTEwMDAuZ3Bpbwo+ICAgICAgWy4uLl0KPgo+dG8KPgo+IAkgICAgICAgQ1BVMCAg
ICAgICBDUFUxCj4gICAgICAyNzogICAgICAgMTk2NiAgICAgICAxOTAwR0lDLTAgIDI3IExldmVs
ICAgICBhcmNoX3RpbWVyCj4gICAgICAyOTogICAgICAgIDU4MCAgICAgICAgICAwR0lDLTAgMjA1
IExldmVsICAgICBlNjBiMDAwMC5pMmMKPiAgICAgIDMwOiAgICAgICAgICAwICAgICAgICAgIDBH
SUMtMCAxNzQgTGV2ZWwgICAgIGZmY2EwMDAwLnRpbWVyCj4gICAgICAzMTogICAgICAgICAgMCAg
ICAgICAgICAwR0lDLTAgIDM2IExldmVsICAgICBlNjA1MDAwMC5ncGlvCj4gICAgICAzMjogICAg
ICAgICAgMCAgICAgICAgICAwR0lDLTAgIDM3IExldmVsICAgICBlNjA1MTAwMC5ncGlvCj4gICAg
ICBbLi4uXQo+Cj5tYWtpbmcgdGhlIG91dHB1dCBoYXJkIHRvIHJlYWQsIGFuZCBwcm9iYWJseSBi
cmVha2luZyBzY3JpcHRzIHRoYXQgcGFyc2UKPml0cyBjb250ZW50cy4KClRoYW5rcyBmb3IgcmVw
b3J0aW5nIHRoaXMsIEkgd2FzIGNvbnNpZGVyaW5nIHRoZSBzcGFjZXMgYW5kIGNoZWNrZWQgaXQg
b24gbXkgc3lzdGVtLApJIHRob3VnaHQgImFsbCIgZGVzY3JpcHRpb25zIGhhdmUgbGVhZGluZyBz
cGFjZXMgYW5kIGl0J3Mgb2sgdG8gcmVtb3ZlIHRoZSBleHRyYSBvbmUuCkJ1dCBJIGRpZCBub3Qg
Y2hlY2sgYWxsIHRoZSAiaXJxX3ByaW50X2NoaXAiIGNvZGVzLCBub3cgd2hlbgpjaGVja2luZyB0
aGUgY29kZSwgdGhlcmUgYXJlIG1hbnkgR1BJTyBkcml2ZXJzJyBpbXBsZW1lbnRhdGlvbnMgd2l0
aCBubyBsZWFkaW5nIHNwYWNlcy4KKFRoZSBiZWhhdmlvciBpcyBub3QgY29uc2lzdGVudCBjcm9z
cyAgZHJpdmVyIGltcGxlbWVudGF0aW9ucyB0aG91Z2guLi4pCgpTb3JyeSBmb3IgdGhlIHJlZ3Jl
c3Npb24sIGFuZCB0aGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuCgoKRGF2aWQK

