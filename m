Return-Path: <linux-renesas-soc+bounces-10848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807F9E1ABB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12D92881DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7721DE8AA;
	Tue,  3 Dec 2024 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Yp91z2fP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40512E3EE;
	Tue,  3 Dec 2024 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224795; cv=none; b=IUQuKCWWBOdJsQbuMep4k6CMWqnQXCZqsqw3QV+oQYUdi1oJifpZg6nkl+iWbnK7xUKJLE4e36C2r7SPXcMtdVxk9+ogHohZnQMazlbLu5m/Ad3FmYHGsBmBgpLXgP+EBLnzatINgMZ+oe3G4rmB5lPdkgSKp+tCGdaQZvwiZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224795; c=relaxed/simple;
	bh=BUWPNcftvuUVwOA85dalJBJjbsm5PrSjo2vTI/GhCzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=R0LyQNZkKmf2eYoUhHGBl0gDUMiMSBzsVa7fNkGv8VLghiq1pgAatFWOeNMW1fH12itbm+ScmeZ9HUG6r2MXFyjX7jJHsx1akmrvv5LTYATiyumEj83hgKgCz4L6cjMcmuttAEGbQZs1yjgKZR+2gSv6+wE6GislZzXQ1BMVeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Yp91z2fP reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=uXSz1NMc4QzgOD4LuOsj2hqaTCLUCjfqyvE+4sFTqzk=; b=Y
	p91z2fPL3LLpSh/O6b3vJCh+MH2GEtgfrHjn9wcsN/5Y032kywABxCLgaK7JfOUi
	VKn6NmJLOzoPxpl8VE9eLvXIMobcZuDvP9LOi7IQRmNlzbghakr/fU6PaN80Hb3t
	/vbMv9f9uyQ/Lz1aKM4dexQzc/nSo6bVHCAMCZSURc=
Received: from 00107082$163.com ( [111.35.188.140] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Tue, 3 Dec 2024 19:19:21 +0800 (CST)
Date: Tue, 3 Dec 2024 19:19:21 +0800 (CST)
From: "David Wang" <00107082@163.com>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re:[PATCH] genirq/proc: Add missing space separator back
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <87zfldt5g4.ffs@tglx>
References: <20241108160717.9547-1-00107082@163.com>
 <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org> <87ed36zon8.ffs@tglx>
 <CAMuHMdVrHy58pGft0tsFF2Npy4=rE-JCeEEDqVHMDabyVLXhPQ@mail.gmail.com>
 <87zfldt5g4.ffs@tglx>
X-NTES-SC: AL_Qu2YAf6Zu08t5yWaYekZnEYQheY4XMKyuPkg1YJXOp80lyTG+CwnbG5DM1vM/PmfNCCmoQmSeyRM6s5Bdq14U7lrI4Ttr6VDGHgfu3cr8si4
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <c11bf69.ab4e.1938c3f08b8.Coremail.00107082@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:fygvCgD3_6c66U5nZFU3AA--.24599W
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMwaqqmdO2BjT4QADst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkF0IDIwMjQtMTItMDMgMTg6NDA6NDMsICJUaG9tYXMgR2xlaXhuZXIiIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+VGhlIHJlY2VudCBjb252ZXJzaW9uIG9mIHNob3dfaW50ZXJydXB0cygp
IHRvIHNlcV9wdXRfZGVjaW1hbF91bGxfd2lkdGgoKQo+Y2F1c2VkIGEgZm9ybWF0dGluZyByZWdy
ZXNzaW9uIGFzIGl0IGRyb3BzIGEgcHJldmlvc3VseSBleGlzdGluZyBzcGFjZQo+c2VwYXJhdG9y
Lgo+Cj5BZGQgaXQgYmFjayBieSB1bmNvbmRpdGlvbmFsbHkgaW5zZXJ0aW5nIGEgc3BhY2UgYWZ0
ZXIgdGhlIGludGVycnVwdAo+Y291bnRzIGFuZCByZW1vdmluZyB0aGUgZXh0cmEgbGVhZGluZyBz
cGFjZSBmcm9tIHRoZSBjaGlwIG5hbWUgcHJpbnRzLgo+Cj5GaXhlczogZjllZDFmN2MyZTI2ICgi
Z2VuaXJxL3Byb2M6IFVzZSBzZXFfcHV0X2RlY2ltYWxfdWxsX3dpZHRoKCkgZm9yIGRlY2ltYWwg
dmFsdWVzIikKPlJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPgo+U2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+Cj5UZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
Cj5DbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80Y2UxODg1MS02ZTlmLWJiZS04
MzE5LWNjNWU2OWZiNDVjQGxpbnV4LW02OGsub3JnCj4tLS0KPiBrZXJuZWwvaXJxL3Byb2MuYyB8
ICAgIDcgKysrKy0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPi0tLSBhL2tlcm5lbC9pcnEvcHJvYy5jCj4rKysgYi9rZXJuZWwvaXJxL3Byb2Mu
Ywo+QEAgLTUwMSwxNyArNTAxLDE4IEBAIGludCBzaG93X2ludGVycnVwdHMoc3RydWN0IHNlcV9m
aWxlICpwLAo+IAo+IAkJc2VxX3B1dF9kZWNpbWFsX3VsbF93aWR0aChwLCAiICIsIGNudCwgMTAp
Owo+IAl9Cj4rCXNlcV9wdXRjKHAsICcgJyk7Cj4gCj4gCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgm
ZGVzYy0+bG9jaywgZmxhZ3MpOwo+IAlpZiAoZGVzYy0+aXJxX2RhdGEuY2hpcCkgewo+IAkJaWYg
KGRlc2MtPmlycV9kYXRhLmNoaXAtPmlycV9wcmludF9jaGlwKQo+IAkJCWRlc2MtPmlycV9kYXRh
LmNoaXAtPmlycV9wcmludF9jaGlwKCZkZXNjLT5pcnFfZGF0YSwgcCk7Cj4gCQllbHNlIGlmIChk
ZXNjLT5pcnFfZGF0YS5jaGlwLT5uYW1lKQo+LQkJCXNlcV9wcmludGYocCwgIiAlOHMiLCBkZXNj
LT5pcnFfZGF0YS5jaGlwLT5uYW1lKTsKPisJCQlzZXFfcHJpbnRmKHAsICIlOHMiLCBkZXNjLT5p
cnFfZGF0YS5jaGlwLT5uYW1lKTsKPiAJCWVsc2UKPi0JCQlzZXFfcHJpbnRmKHAsICIgJThzIiwg
Ii0iKTsKPisJCQlzZXFfcHJpbnRmKHAsICIlOHMiLCAiLSIpOwo+IAl9IGVsc2Ugewo+LQkJc2Vx
X3ByaW50ZihwLCAiICU4cyIsICJOb25lIik7Cj4rCQlzZXFfcHJpbnRmKHAsICIlOHMiLCAiTm9u
ZSIpOwo+IAl9Cj4gCWlmIChkZXNjLT5pcnFfZGF0YS5kb21haW4pCj4gCQlzZXFfcHJpbnRmKHAs
ICIgJSpsdSIsIHByZWMsIGRlc2MtPmlycV9kYXRhLmh3aXJxKTsKCgpSZXZpZXdlZC1ieTogICAg
RGF2aWQgV2FuZyA8MDAxMDcwODJAMTYzLmNvbT4KCkFuZCBhZ2Fpbiwgc29ycnkgZm9yIHRoZSBy
ZWdyZXNzaW9uLi4uCgpUaGFua3MKRGF2aWQK

