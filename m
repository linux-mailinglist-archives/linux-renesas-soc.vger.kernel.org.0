Return-Path: <linux-renesas-soc+bounces-10628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B489D371F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5CD31F21B80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B3C22318;
	Wed, 20 Nov 2024 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Tmgdm04a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1EF19C566;
	Wed, 20 Nov 2024 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732095400; cv=none; b=Vu+zhtT2g5hhjXRcqODdg6n75O9bft5eHRbRUYM7M7ZV+4V25HxzRFgG9L84hweu/im4f2rcXnFM5bnTH25wloniXtk5keLrMJM7FHgwzqudBr1TYnysegTINZC9TYUnyNqTZTIoCA7h228KPTuJQKRct6eIHnBQdTUsC0Vuoqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732095400; c=relaxed/simple;
	bh=eQ13oS8w+zZiWpZalLdQZ2HHV6dErXU/FvIyOzGR0ic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=gDA240uTW/+E1sp4Wn1I9IO7AlBpylcabw04MQpE8/CcoGHs1fEeoDF1TnCACYvCYWjM5K0CT7tXAmpnsdRL3qIckPRzz3X5CeMGXnAdY6nQlTichhRNyU2k9Zxszckmj1VZaGrKTbsVEqZlgamIeXrDBgkP4PqhzvWSaPeDRVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Tmgdm04a reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QxX7+bW8i9Cke6vXm2kkHQcRThBprao3lkeSccNlKgI=; b=T
	mgdm04aZTvpl3MmZZuCRJ4Ne2VSMy4ny30IGUUYVcBaSIl3eGAd6wIULrjNNFgrW
	8MdWUa1lqWT7Wv7xjqOrAWPRlcOFY2+cTAhvmPhjDyapy4M/tW7LDwJpKyuDEV1s
	YGSeqlAp8CxfBSJE3Y4KtQCHgtWhjBPamrDtRWYJdE=
Received: from 00107082$163.com ( [111.35.191.191] ) by
 ajax-webmail-wmsvr-40-130 (Coremail) ; Wed, 20 Nov 2024 17:36:22 +0800
 (CST)
Date: Wed, 20 Nov 2024 17:36:22 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <CAMuHMdUGt-8onJqKbai9Uc+Vb-YHXKx_ggMqyURJp5btuf1v_A@mail.gmail.com>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <5ed0a36f.1698.1934737447d.Coremail.00107082@163.com>
 <710d6832.1f29.19347541394.Coremail.00107082@163.com>
 <CAMuHMdUGt-8onJqKbai9Uc+Vb-YHXKx_ggMqyURJp5btuf1v_A@mail.gmail.com>
X-NTES-SC: AL_Qu2YAPySuksj5CeeZ+kXn0oTju85XMCzuv8j3YJeN500mCXf9xIAbG5BDXrs9fmmJyqmoQmcXD1VwcJXdoVBfJOCImjoGNg9beLqXWcsE0iW
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <613460f0.9d25.19348ee14f1.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gigvCgD3n3qXrT1n6fgrAA--.57131W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gudqmc9pPWIMAAGsb
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTEtMjAgMTc6MDA6MzgsICJHZWVydCBVeXR0ZXJob2V2ZW4iIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4gd3JvdGU6Cj5IaSBEYXZpZCwKPgoKPj4KPj4gU2V2ZXJhbCBkcml2ZXJzIHVz
ZSBkZXZfbmFtZSBhcyBmb3JtYXQgc3RyaW5nIGZvciBzZXFfcHJpbnRmLCAgd291bGQgdGhpcyBy
YWlzZSBzZWN1cml0eSBjb25jZXJucz8KPj4KPj4gICAgICAgIGRyaXZlcnMvZ3Bpby9ncGlvLXhn
cy1pcHJvYy5jOiAgIHNlcV9wcmludGYocCwgZGV2X25hbWUoY2hpcC0+ZGV2KSk7Cj4+ICAgICAg
ICAgZHJpdmVycy9ncGlvL2dwaW8tbWx4YmYyLmM6ICAgICBzZXFfcHJpbnRmKHAsIGRldl9uYW1l
KGdzLT5kZXYpKTsKPj4gICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby1vbWFwLmM6ICAgICAgIHNl
cV9wcmludGYocCwgZGV2X25hbWUoYmFuay0+ZGV2KSk7Cj4+ICAgICAgICAgZHJpdmVycy9ncGlv
L2dwaW8taGx3ZC5jOiAgICAgICBzZXFfcHJpbnRmKHAsIGRldl9uYW1lKGhsd2QtPmRldikpOwo+
PiAgICAgICAgIGRyaXZlcnMvZ3Bpby9ncGlvLWFzcGVlZC5jOiAgICAgc2VxX3ByaW50ZihwLCBk
ZXZfbmFtZShncGlvLT5kZXYpKTsKPj4gICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby1wY2E5NTN4
LmM6ICAgIHNlcV9wcmludGYocCwgZGV2X25hbWUoZ2MtPnBhcmVudCkpOwo+PiAgICAgICAgIGRy
aXZlcnMvZ3Bpby9ncGlvLXRlZ3JhMTg2LmM6ICAgc2VxX3ByaW50ZihwLCBkZXZfbmFtZShnYy0+
cGFyZW50KSk7Cj4+ICAgICAgICAgZHJpdmVycy9ncGlvL2dwaW8tdGVncmEuYzogICAgICBzZXFf
cHJpbnRmKHMsIGRldl9uYW1lKGNoaXAtPnBhcmVudCkpOwo+PiAgICAgICAgIGRyaXZlcnMvZ3Bp
by9ncGlvLWVwOTN4eC5jOiAgICAgc2VxX3ByaW50ZihwLCBkZXZfbmFtZShnYy0+cGFyZW50KSk7
Cj4+ICAgICAgICAgZHJpdmVycy9ncGlvL2dwaW8tYXNwZWVkLXNncGlvLmM6ICAgICAgIHNlcV9w
cmludGYocCwgZGV2X25hbWUoZ3Bpby0+ZGV2KSk7Cj4+ICAgICAgICAgZHJpdmVycy9ncGlvL2dw
aW8tcGwwNjEuYzogICAgICBzZXFfcHJpbnRmKHAsIGRldl9uYW1lKGdjLT5wYXJlbnQpKTsKPj4g
ICAgICAgICBkcml2ZXJzL2dwaW8vZ3Bpby12aXNjb250aS5jOiAgIHNlcV9wcmludGYocCwgZGV2
X25hbWUocHJpdi0+ZGV2KSk7Cj4KPkluIHRoZW9yeSwgeWVzLiBCdXQgSSBndWVzcyBpdCdzIGhh
cmQgdG8gc25lYWsgYSBwZXJjZW50IHNpZ24gaW4gdGhlc2UKPmRldmljZSBuYW1lcy4KClllcywg
aXQgaXMganVzdCB0aGVvcmV0aWNhbC4uLiAoV291bGQgYmUgYSB3b25kZXJmdWwgc3RvcnkgaWYg
c29tZW9uZSBtYW5hZ2UgaXQgc29tZWhvdyA6KSApCkFueXdheSwgSSBzZW5kIG91dCBhbm90aGVy
IHBhdGNoIGZvciBmdXJ0aGVyIGRpc2N1c3Npb24uCgo+Cj5CdXQgZ2l2ZW4gdGhlIGFib3ZlLCBh
bGwgb2YgdGhlbSBzaG91bGQgcHJvYmFibHkgYmUgdXBkYXRlZCB0byBwcmludAo+YW4gaW5pdGlh
bCBzcGFjZT8KPgpPaCwgbm8sIEkgZGlkIG5vdCBtZWFuIHRvIGFkZGluZyBsZWFkaW5nIHNwYWNl
IGZvciB0aG9zZSBpbiBpcnFfcHJpbnRfY2hpcCgpCkkgbWVudGlvbmVkIHRob3NlIGp1c3QgYmVj
YXVzZSBvZiB0aGUgZm9ybWF0IHN0cmluZyB0aGluZy4KCkFkZCBsZWFkaW5nIHNwYWNlIGluIHRo
b3NlIGlycV9wcmludF9jaGlwKCkgaXMga2luZCBvZiBzdHJhbmdlLi4uCldpdGggVGhvbWFzJ3Mg
cGF0Y2gsIGlycV9wcmludF9jaGlwKCkgbmVlZHMgbm90IHdvcnJ5IGFib3V0IHRoZSBsZWFkaW5n
IHNwYWNlIGlzc3VlLiAKCgo+R3J7b2V0amUsZWV0aW5nfXMsCj4KPiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0Cj4KPi0tIAo+R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+Cj5JbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0Cj53aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgoKVGhhbmtzfgpEYXZpZA==

