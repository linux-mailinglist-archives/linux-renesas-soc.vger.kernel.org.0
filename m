Return-Path: <linux-renesas-soc+bounces-34850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CpvRC1skTmrmDwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:20:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D827242EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:20:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="c cVRFzf";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A05BE304E403
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDAA38757B;
	Wed,  8 Jul 2026 10:11:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3009E3822A8;
	Wed,  8 Jul 2026 10:10:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505461; cv=none; b=C1WvZIf9Hoz5GfEzX+eIH/Wa2YiDsUujzH2gXEtLuulzDkGioshJwfvL1KZF6xNUmvw/ofddhCsMhUhBQZTZSXkkzCHcRlKfWFm08tdcpDjkpJf1bJ2p/x79blUd5XSSqj1YPDeGYuPDZndi4K01OD4nir8brS2p8pftGju7QDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505461; c=relaxed/simple;
	bh=WpBjrU+g63CVj1WCaEKexhvNPjV1/Ss+5/QxmGjSRRU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=H24pCleMJSjFR98IAfCtuzoSCMq/KTphrNIvBEvZBs9z85no8oIDSmrOy37VE62m7Hi5uCaID6nVHEiz/PcPlI55SvW/NVRuW66Sychobe52tFRWtwiV3nhcq6QDR4HM8zTIjtOSFeUKiEhpnV9oXAB+Kqw8l72ZXClUtjK+5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ccVRFzft; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=WpBjrU+g63CVj1WCaEKexhvNPjV1/Ss+5/QxmGjSRRU=; b=c
	cVRFzftsbMD53Ccvpib/JGF7bOcsMraoNG6+y2qzDm/3xHiUDatbORFZ1j5rLbKj
	bINSvHhwHzAvS4dBfSoGBcPlwAGUq7aklySxrsNlCRODa0nKj8Razdy5FAmUHftD
	S6qlD6MjBCgAASzBaJuY+DsuLba1rTPlLyGl/FnhT4=
Received: from fuqingshuang$kylinos.cn ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-125 (Coremail) ; Wed, 8 Jul 2026 18:10:20 +0800 (CST)
Date: Wed, 8 Jul 2026 18:10:20 +0800 (CST)
From: "Qingshuang Fu" <fuqingshuang@kylinos.cn>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Thomas Gleixner" <tglx@linutronix.de>,
	"Magnus Damm" <damm+renesas@opensource.se>,
	"Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re:Re: [PATCH v4] irqchip/renesas-irqc: fix generic interrupt chip
 leak on remove
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
Sender: fffsqian@163.com
In-Reply-To: <CAMuHMdUxEnBx-2dvjSUPMjEb__0c-44y00OH9oftkPqoW18YyA@mail.gmail.com>
References: <874ii9svk6.ffs@fw13> <20260708093849.501946-1-fffsqian@163.com>
 <CAMuHMdUxEnBx-2dvjSUPMjEb__0c-44y00OH9oftkPqoW18YyA@mail.gmail.com>
X-NTES-SC: AL_Qu2TAfmbukwp5iiYZekckk4Vhu49Xcq2vvQv34Fec80EszD10SE5Q1hmJ3f36caPChm0sBSGSRl1xMtQYrtZ1bHHk54VLR2SEoI+N/3Q6Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <28e72a54.8bac.19f41350209.Coremail.fuqingshuang@kylinos.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:fSgvCgD3n0QMIk5q2dEZAA--.9971W
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6gy5hGpOIgx0QQAA3k
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:tglx@linutronix.de,m:damm+renesas@opensource.se,m:maz@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:damm@opensource.se,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[fuqingshuang@kylinos.cn,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuqingshuang@kylinos.cn,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34850-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,vger.kernel.org:from_smtp,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:from_mime,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67D827242EB

QXQgMjAyNi0wNy0wOCAxNzo0ODowNywgIkdlZXJ0IFV5dHRlcmhvZXZlbiIgPGdlZXJ0QGxpbnV4
LW02OGsub3JnPiB3cm90ZToKPkhpIFFpbmdzaHVhbmcsCj4KPk9uIFdlZCwgOCBKdWwgMjAyNiBh
dCAxMTozOSwgUWluZ3NodWFuZyBGdSA8ZmZmc3FpYW5AMTYzLmNvbT4gd3JvdGU6Cj4+IEZyb206
IFFpbmdzaHVhbmcgRnUgPGZ1cWluZ3NodWFuZ0BreWxpbm9zLmNuPgo+Pgo+PiBUaGUgZHJpdmVy
IGFsbG9jYXRlcyBkb21haW4gZ2VuZXJpYyBjaGlwcyB1c2luZwo+PiBpcnFfYWxsb2NfZG9tYWlu
X2dlbmVyaWNfY2hpcHMoKSBkdXJpbmcgcHJvYmUuIEhvd2V2ZXIsIG9uIGRyaXZlcgo+PiByZW1v
dmUsIHRoZSBnZW5lcmljIGNoaXBzIGFyZSBub3QgYXV0b21hdGljYWxseSBmcmVlZCB3aGVuIHRo
ZSBpbnRlcnJ1cHQKPj4gZG9tYWluIGlzIHJlbW92ZWQgYmVjYXVzZSB0aGUgZG9tYWluIGZsYWdz
IGRvIG5vdCBpbmNsdWRlCj4+IElSUV9ET01BSU5fRkxBR19ERVNUUk9ZX0dDLgo+Pgo+PiBUaGlz
IGNhdXNlcyBib3RoIHRoZSBkb21haW4gZ2VuZXJpYyBjaGlwcyBzdHJ1Y3R1cmUgYW5kIHRoZSBh
c3NvY2lhdGVkCj4+IGdlbmVyaWMgY2hpcHMgdG8gYmUgbGVha2VkLiBBZGRpdGlvbmFsbHksIHRo
ZSBnZW5lcmljIGNoaXBzIHJlbWFpbiBvbgo+PiB0aGUgZ2xvYmFsIGdjX2xpc3QgYW5kIG1heSBs
YXRlciBiZSB2aXNpdGVkIGJ5IGdlbmVyaWMgaW50ZXJydXB0IGNoaXAKPj4gc3VzcGVuZCwgcmVz
dW1lLCBvciBzaHV0ZG93biBjYWxsYmFja3MgYWZ0ZXIgdGhlIGRyaXZlciBoYXMgYmVlbiByZW1v
dmVkLAo+PiBwb3RlbnRpYWxseSByZXN1bHRpbmcgaW4gYSB1c2UtYWZ0ZXItZnJlZSBhbmQga2Vy
bmVsIGNyYXNoLgo+Pgo+PiBGaXggdGhlIHJlc291cmNlIGxlYWsgYnkgc2V0dGluZyBJUlFfRE9N
QUlOX0ZMQUdfREVTVFJPWV9HQyBvbiB0aGUKPj4gaW50ZXJydXB0IGRvbWFpbjsgdGhpcyBsZXRz
IHRoZSBpbnRlcnJ1cHQgZG9tYWluIGNvcmUgYXV0b21hdGljYWxseQo+PiByZWxlYXNlIGFsbCBn
ZW5lcmljIGNoaXBzIHdoZW4gaXJxX2RvbWFpbl9yZW1vdmUoKSBpcyBjYWxsZWQsIHJlbW92aW5n
Cj4+IHRoZSBuZWVkIGZvciBtYW51YWwgY2xlYW51cCBjYWxscyBpbiBlcnJvciBwYXRocyBhbmQg
cmVtb3ZlIGNhbGxiYWNrLgo+Pgo+PiBGaXhlczogOTljMjIxZGYzM2ZiZmExYiAoImlycWNoaXAv
cmVuZXNhcy1pcnFjOiBNb3ZlIG92ZXIgdG8gbmVzdGVkIGdlbmVyaWMgY2hpcCIpCj4KPlRoYW5r
cyBmb3IgdGhlIHVwZGF0ZSEKPk5vIGNoYW5nZWxvZz8KPgo+PiBTaWduZWQtb2ZmLWJ5OiBRaW5n
c2h1YW5nIEZ1IDxmdXFpbmdzaHVhbmdAa3lsaW5vcy5jbj4KPj4gUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4KPlBsZWFzZSBkbyBub3Qg
cmV0YWluIFJiLXRhZ3Mgd2hlbiBjb21wbGV0ZWx5IGNoYW5naW5nIGEgcGF0Y2guCj4KPj4gLS0t
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLWlycWMuYwo+PiArKysgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJlbmVzYXMtaXJxYy5jCj4+IEBAIC0xOTQsNiArMTk0LDkgQEAgc3RhdGljIGlu
dCBpcnFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgICAgICAgcC0+
Z2MtPmNoaXBfdHlwZXNbMF0uY2hpcC5pcnFfc2V0X3dha2UgID0gaXJxY19pcnFfc2V0X3dha2U7
Cj4+ICAgICAgICAgcC0+Z2MtPmNoaXBfdHlwZXNbMF0uY2hpcC5mbGFncyA9IElSUUNISVBfTUFT
S19PTl9TVVNQRU5EOwo+Pgo+PiArICAgICAgIC8qIEF1dG9tYXRpY2FsbHkgZnJlZSBnZW5lcmlj
IGNoaXBzIHdoZW4gaW50ZXJydXB0IGRvbWFpbiBpcyBkZXN0cm95ZWQgKi8KPgo+SSBhbSBub3Qg
c3VyZSB5b3UgbmVlZCB0aGUgY29tbWVudC4KPgo+PiArICAgICAgIHAtPmlycV9kb21haW4tPmZs
YWdzIHw9IElSUV9ET01BSU5fRkxBR19ERVNUUk9ZX0dDOwo+PiArCj4KPkxHVE0sIGJ1dCB5b3Ug
bWF5IHdhbnQgdG8gZG8gdGhpcyByaWdodCBhZnRlciBjcmVhdGluZyBwLT5pcnFfZG9tYWluLAo+
bGlrZSBpcyBkb25lIGluIHBkY19pbnRjX3Byb2JlKCkuCj4KPj4gICAgICAgICBpcnFfZG9tYWlu
X3NldF9wbV9kZXZpY2UocC0+aXJxX2RvbWFpbiwgZGV2KTsKPj4KPj4gICAgICAgICAvKiByZXF1
ZXN0IGludGVycnVwdHMgb25lIGJ5IG9uZSAqLwo+Pgo+Cj5HcntvZXRqZSxlZXRpbmd9cywKPgo+
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgo+LS0gCj5HZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCj4KPkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCgpIaSBHZWVydCwK
ClRoYW5rcyBmb3IgeW91ciByZXZpZXcuIEkndmUgdXBkYXRlZCB0aGUgcGF0Y2ggdG8gdjUgYXMg
eW91ciBzdWdnZXN0aW9uczoKMS4gQWRkZWQgZnVsbCB2ZXJzaW9uIGNoYW5nZWxvZyB1bmRlciBz
cGxpdCBsaW5lLgoyLiBNb3ZlZCBJUlFfRE9NQUlOX0ZMQUdfREVTVFJPWV9HQyBhc3NpZ25tZW50
IHJpZ2h0IGFmdGVyIGlycV9kb21haW4gY3JlYXRpb24uCjMuIFJlbW92ZWQgcmVkdW5kYW50IGNv
bW1lbnQgYW5kIGRyb3BwZWQgb2xkIFJldmlld2VkLWJ5IHRhZyBhcyBpbXBsZW1lbnRhdGlvbiBm
dWxseSBjaGFuZ2VkLgoKdjUgcGF0Y2ggYXR0YWNoZWQuCgpRaW5nc2h1YW5nIEZ1Cgo=

