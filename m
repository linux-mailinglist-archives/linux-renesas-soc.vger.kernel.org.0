Return-Path: <linux-renesas-soc+bounces-12931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75209A2BC24
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 08:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 865323A3EBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2025 07:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F401C1A238A;
	Fri,  7 Feb 2025 07:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DqZticIc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552E18C93C;
	Fri,  7 Feb 2025 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738912603; cv=none; b=B1ehUPD2BdGIxq0NnfpTUL5PFUsW4U47hsM+fyIF0Alb4XpyDV2QqNZttraMo4ci2f0ScYPDj8QFwcPOzTJppFSGLavWhy1X+ROVAelBrUgYNpecgQNrWu7LzdhLjw0ZdkqvbA221sVjUB1Djao/srg7iuY4E/aQxrWC/FXJ69I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738912603; c=relaxed/simple;
	bh=2GN1NU3tJjR3b9qlw2Ov2OyUerdjYXF7dBWJ1LPloZg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j3wScj3NeZn60LWyYNPCMhPrlZYX++i/5XJZvRqkIdkRN3k4H/RqJu2N5BgZUKqlYZhpTCD3rWEEgmISAbVrL6fvG7noR2VPBM/qzWjE78WNOPv6cG1X1UTnZcLDyekIQ/ur60zFuBRXI0rnR0tbVk8h9FyLS2EByxYanft+yj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DqZticIc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738912594;
	bh=2GN1NU3tJjR3b9qlw2Ov2OyUerdjYXF7dBWJ1LPloZg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DqZticIco6xTt9rAFjK6Gh3OJX/LCUq93zaeumuCbWYvVEhK3QrhmFOKYjpA+XmiB
	 r0XyuanliRK+rrcc1VNwWzwpsUo/6txJW7YCuAc0UpLZvpqC/y6JIjFex7y3BodFMb
	 myl6tLmvqb9CkslMZb9PGAohSMkEG17UgDEK8RD9uBJd/AMFqYmBc8y3Di/WBYWOHS
	 hzRjowGJT2X2gq3EVpQvYD2i6HPU+xXTUmy+kg0hDkH2v/TfRQ1lnlCB8nM/zaaoKT
	 KKVQW6FdnPqkCHqHlSt+uAJX+zwzeiFg/w2WdLIEdYmAtNWLwuvqfMZzJqiDiIaRSC
	 wgQ5OzKA7Uuzg==
Received: from apertis-1.home (2a01cb088CCA73006086f5f072C6a07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 107A317E0FC3;
	Fri,  7 Feb 2025 08:16:34 +0100 (CET)
Message-ID: <950770a2406dd9ac3163e677c6d887d06df5b8c6.camel@collabora.com>
Subject: Re: [PATCH v3 2/2] arm64: renesas: add initial support for MYIR
 Remi Pi
From: Julien Massot <julien.massot@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 07 Feb 2025 08:16:33 +0100
In-Reply-To: <CAMuHMdXAS6pnNcT=A7i9La22tbDXYf7EKqbJzHuK2ze2gf6cgg@mail.gmail.com>
References: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com>
	 <20250131-myir-remi-pi-v3-2-2dda53e79291@collabora.com>
	 <CAMuHMdXAS6pnNcT=A7i9La22tbDXYf7EKqbJzHuK2ze2gf6cgg@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgR2VlcnQsIEtyenlzenRvZiwKCj4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxMDo1OCwgSnVs
aWVuIE1hc3NvdCA8anVsaWVuLm1hc3NvdEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+IEFkZCBi
YXNpYyBzdXBwb3J0IGZvciB0aGUgTVlJUiBSZW1pIFBpIChiYXNlZCBvbiByOWEwN2cwNDRsMik6
Cj4gPiDCoC0gVUFSVAo+ID4gwqAtIGkyYwo+ID4gwqAtIGVtbWMKPiA+IMKgLSBVU0IgaG9zdAo+
ID4gwqAtIEhETUkgb3V0cHV0Cj4gPiDCoC0gRXRoZXJuZXQKPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIE1hc3NvdCA8anVsaWVuLm1hc3NvdEBjb2xsYWJvcmEuY29tPgo+IAo+IFRoYW5r
cyBmb3IgdGhlIHVwZGF0ZSEKPiAKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDRsMi1yZW1pLXBpLmR0cwo+ID4gQEAgLTAsMCAr
MSwzNTEgQEAKPiAKPiA+ICsvIHsKPiA+ICvCoMKgwqDCoMKgwqAgbW9kZWwgPSAiTVlJUiBUZWNo
IExpbWl0ZWQgUmVtaSBQaSBNWUItWUcyTFgtUkVNSSI7Cj4gPiArwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAibXlpcixyZW1pLXBpIiwgInJlbmVzYXMscjlhMDdnMDQ0bDIiLCAicmVuZXNhcyxy
OWEwN2cwNDQiOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBhbGlhc2VzIHsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0aGVybmV0MCA9ICZldGgwOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZXRoZXJuZXQxID0gJmV0aDE7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpMmMwID0gJmkyYzA7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpMmMxID0gJmkyYzE7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpMmMyID0gJmkyYzI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpMmMzID0g
JmkyYzM7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtbWMwID0gJnNk
aGkwOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VyaWFsMCA9ICZz
Y2lmMDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlcmlhbDMgPSAmc2NpZjM7
Cj4gCj4gV2Fzbid0IHRoZSBwbGFuIHRvIGRyb3Agc2NpZjMsIHNvIGl0IGNhbiBiZSB1c2VkIGJ5
IGFuIFJUT1MgcnVubmluZwo+IG9uIHRoZSBDb3J0ZXgtQTMzIGNvcmU/ClNvcnJ5LCBpbmRlZWQg
SSBmb3Jnb3Qgc2NpZjMgcmVtb3ZhbC4gSSBkb24ndCBzZWUgYSByZWFzb24gdG8gYm9ycm93IHRo
ZQpDb3J0ZXgtQTMzIHNjaWYuCgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2VyaWFsNCA9ICZzY2lmNDsKPiA+ICvCoMKgwqDCoMKgwqAgfTsKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqAgY2hvc2VuIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0ZG91dC1w
YXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwo+ID4gK8KgwqDCoMKgwqDCoCB9Owo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoCBtZW1vcnlANDgwMDAwMDAgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qIGZpcnN0IDEyOE1CIGlzIHJlc2VydmVkIGZvciBzZWN1cmUgYXJlYS4gKi8K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg0ODAwMDAwMCAw
eDAgMHgzODAwMDAwMD47Cj4gPiArwqDCoMKgwqDCoMKgIH07Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgIHJlZ181cDB2OiByZWd1bGF0b3ItNXAwdiB7Cj4gCj4gPiArwqDCoMKgwqDCoMKgIHJlZ18z
cDN2OiByZWd1bGF0b3ItM3AzdiB7Cj4gCj4gPiArwqDCoMKgwqDCoMKgIHJlZ18xcDh2OiByZWd1
bGF0b3ItMXA4diB7Cj4gCj4gPiArwqDCoMKgwqDCoMKgIHJlZ18xcDF2OiByZWd1bGF0b3ItdmRk
LWNvcmUgewo+IAo+ID4gK8KgwqDCoMKgwqDCoCBoZG1pLW91dCB7Cj4gCj4gTW9yZSBzb3J0aW5n
IHdvcmsgdG8gZG8uLi4KPiAKPiBPaywgSSB3aWxsIGtlZXAgaW4gbWluZCBmb3IgdGhlIG5leHQg
dGltZS4KPiAKPiAKPiA+ICt9Owo+IAo+ID4gK8KgwqDCoMKgwqDCoCBzZGhpMF9waW5zOiBzZDAg
ewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2QwX2RhdGEgewo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMgPSAiU0QwX0RBVEEw
IiwgIlNEMF9EQVRBMSIsICJTRDBfREFUQTIiLCAiU0QwX0RBVEEzIiwKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJTRDBfREFU
QTQiLCAiU0QwX0RBVEE1IiwgIlNEMF9EQVRBNiIsICJTRDBfREFUQTciOwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyLXNvdXJjZSA9IDwxODAw
PjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPiArCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZDBfY3RybCB7Cj4gCj4gSGVyZSwgdG9vLiBQbHVzIHRo
ZSB1bmRlcnNjb3JlcyByZXBvcnRlZCBieSBLcnp5c3p0b2YuCk9rLCBubyB1bmRlcnNjb3JlIGlu
IG5vZGUgbmFtZXMsIGV2ZW4gZm9yIHRoZSBwaW5zIGRlZmluaXRpb24uCgo+IAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMgPSAiU0QwX0NMSyIs
ICJTRDBfQ01EIjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwb3dlci1zb3VyY2UgPSA8MTgwMD47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2QwX3JzdCB7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlucyA9
ICJTRDBfUlNUIyI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcG93ZXItc291cmNlID0gPDE4MDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTsKPiA+ICvCoMKgwqDCoMKgwqAgfTsKPiAKPiBJIGZpeGVkIHRoZSBzdHlsZSBpc3N1
ZXMgbG9jYWxseSwgc28gaWYgeW91IGNhbiBjb25maXJtIG9yIGRlbnkgdGhlIHJlbW92YWwKPiBv
ZiBzY2lmMywgSSBjYW4gZml4IHRoYXQgd2hpbGUgYXBwbHlpbmcuCkNvbmZpcm1lZCwgd2Ugc2hv
dWxkIG5vdCBlbmFibGUgc2NpZjMuCgoKVGhhbmtzCi0tIApKdWxpZW4K


