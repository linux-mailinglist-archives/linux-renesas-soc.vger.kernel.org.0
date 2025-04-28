Return-Path: <linux-renesas-soc+bounces-16406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A4A9F0D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 14:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A003B2EA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5EB26980C;
	Mon, 28 Apr 2025 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="mtCJR9N9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8063C267B88;
	Mon, 28 Apr 2025 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843543; cv=none; b=uSIzw9xFL/Iat2hITz5fZwmV94GyoLeXY2+qvHLW9ueu1bUuoqam7YJHCumIKLG/GL+m08R/SwOQQHyKNnJ1UHKrLHG8ixWL3bxgRV81tteN0GaCIzOFiZlinljeQhGk6LNKi9UsuudEBC6PlQhrczGkVwJ5obANZ7VeKqu+La4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843543; c=relaxed/simple;
	bh=kW5psOKXL08k2xjnCfKHJRyKMqOYwQuQkKHDbEr+HFA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=JsDxrvnEijzBbbarHsQ/uo6Xrmw7hsUhiZigKgASLC55EgooupqHJG836rVehArOrnQkcA5JtT/ng/BKliDP5ZcFabxOZUwWsJzogIGPR5tFVs3wy6alMQEDT1yv376yHXujGIwvV7IP9L7Ky2XCoPdtlCrpGL4t+lqcOsASm9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=mtCJR9N9 reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vtjvgZup4DO5ywnw9b4E1q8kivNev25eB77ifmZ/sTs=; b=m
	tCJR9N9x3gtZGhoQsEufXu5MN0AoGgBnc9N9lSkAgpBJLZQPG1Lo+OSqFi93JRvI
	ngq1on+ZxdIr8jyTfxe0JF0drb2Ew9vZJy2Hf/W6P8m2RPPwWSr8TXM061kV2MgE
	mJxqzzkAClVAGiil0kSOzSY7vw1Ezm8kRampFKLAZk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Mon, 28 Apr 2025 20:29:36 +0800
 (CST)
Date: Mon, 28 Apr 2025 20:29:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Jagan Teki" <jagan@amarulasolutions.com>,
	"Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Douglas Anderson" <dianders@chromium.org>,
	"Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Anusha Srivatsa" <asrivats@redhat.com>,
	"Paul Kocialkowski" <paulk@sys-base.io>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Hui Pu" <Hui.Pu@gehealthcare.com>,
	"Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Jani Nikula" <jani.nikula@intel.com>,
	"Sui Jingfeng" <sui.jingfeng@linux.dev>
Subject: Re:[PATCH v2 03/34] drm/bridge: analogix-anx6345: convert to
 devm_drm_bridge_alloc() API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
X-NTES-SC: AL_Qu2fB/SfvEss4CGcZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jBLo1zItdntMFln1/t+OJCOIkReYbzJI9MlIe6VRY6sPAVnVyjji8TlWtnuinPbeFw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <45fac756.a42e.1967c5fd015.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iSgvCgD33wCwdA9oe4WhAA--.62923W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA49XmgPasP6GgADso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKQXQgMjAyNS0wNC0yNSAwMjo1OToxMCwgIkx1Y2EgQ2VyZXNvbGkiIDxsdWNhLmNlcmVz
b2xpQGJvb3RsaW4uY29tPiB3cm90ZToKPlRoaXMgaXMgdGhlIG5ldyBBUEkgZm9yIGFsbG9jYXRp
bmcgRFJNIGJyaWRnZXMuCj4KPlNpZ25lZC1vZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBZYW4gPGFuZHlzaHJrQDE2My5j
b20+Cgo+Cj4tLS0KPgo+Q2M6ICJVd2UgS2xlaW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cj5DYzogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+Q2M6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KPkNj
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+Q2M6IFN1aSBKaW5nZmVuZyA8
c3VpLmppbmdmZW5nQGxpbnV4LmRldj4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXgtYW54NjM0NS5jIHwgOCArKysrLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj5pbmRleCBmMmJhZmE2Y2Y3Nzk1
NmVjYWZjODdhYWUzYTJiNjg5MGJkYjM2Y2ZhLi5mM2ZlNDdiMTJlZGNhMWY5MmRkZDMwNmQxNTJi
ZTE0NGRmNTY0OWI1IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbmFsb2dpeC1hbng2MzQ1LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXgtYW54NjM0NS5jCj5AQCAtNjY0LDkgKzY2NCwxMCBAQCBzdGF0aWMgaW50IGFu
eDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gCXN0cnVjdCBkZXZp
Y2UgKmRldjsKPiAJaW50IGksIGVycjsKPiAKPi0JYW54NjM0NSA9IGRldm1fa3phbGxvYygmY2xp
ZW50LT5kZXYsIHNpemVvZigqYW54NjM0NSksIEdGUF9LRVJORUwpOwo+LQlpZiAoIWFueDYzNDUp
Cj4tCQlyZXR1cm4gLUVOT01FTTsKPisJYW54NjM0NSA9IGRldm1fZHJtX2JyaWRnZV9hbGxvYygm
Y2xpZW50LT5kZXYsIHN0cnVjdCBhbng2MzQ1LCBicmlkZ2UsCj4rCQkJCQkmYW54NjM0NV9icmlk
Z2VfZnVuY3MpOwo+KwlpZiAoSVNfRVJSKGFueDYzNDUpKQo+KwkJcmV0dXJuIFBUUl9FUlIoYW54
NjM0NSk7Cj4gCj4gCW11dGV4X2luaXQoJmFueDYzNDUtPmxvY2spOwo+IAo+QEAgLTczOCw3ICs3
MzksNiBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCj4gCS8qIExvb2sgZm9yIHN1cHBvcnRlZCBjaGlwIElEICovCj4gCWFueDYzNDVfcG93
ZXJvbihhbng2MzQ1KTsKPiAJaWYgKGFueDYzNDVfZ2V0X2NoaXBfaWQoYW54NjM0NSkpIHsKPi0J
CWFueDYzNDUtPmJyaWRnZS5mdW5jcyA9ICZhbng2MzQ1X2JyaWRnZV9mdW5jczsKPiAJCWRybV9i
cmlkZ2VfYWRkKCZhbng2MzQ1LT5icmlkZ2UpOwo+IAo+IAkJcmV0dXJuIDA7Cj4KPi0tIAo+Mi40
OS4wCj4K

