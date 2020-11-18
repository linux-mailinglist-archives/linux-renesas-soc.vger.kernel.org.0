Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351FA2B73CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 02:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgKRBi7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 20:38:59 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:41203 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725767AbgKRBi7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 20:38:59 -0500
X-UUID: 630185640108402a83ff2c8a81bef551-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VQSP1sH4CqMAhG3prd+7/b/qG6Nz5rZr5wJPtTA6ytA=;
        b=prPzbxB8X79spbx4u3Y3tAouEp30AENJqm6rlTVLRN1wGwg5kXiB7WzqfJIfPzGn1auqofhq8g0WiGg4tyuA479gQpruShQYS1EVQdEYQa6J24IzQTq2RdM4k1nbTt1sqpZUbD5xK4dZ5nckjiLy6T1+Y0rgwwgA31I9agzLiKk=;
X-UUID: 630185640108402a83ff2c8a81bef551-20201118
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1400451792; Wed, 18 Nov 2020 09:38:53 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Nov
 2020 09:38:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 09:38:50 +0800
Message-ID: <1605663530.31607.40.camel@mhfsdcap03>
Subject: Re: [PATCH] dt-bindings: arm: add additionalProperties
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        <linux-unisoc@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Wed, 18 Nov 2020 09:38:50 +0800
In-Reply-To: <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
References: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
         <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5DF35A84F2346C88C9B1BA1AEF6C513A344973A569469D1148B07A014C4095D62000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVHVlLCAyMDIwLTExLTE3IGF0IDExOjM3ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IEhpIENodW5mZW5nLA0KPiANCj4gT24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMTE6MzIg
QU0gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiBB
ZGQgYW4gZXhwbGljaXQgImFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlIiB0byBhdm9pZA0KPiA+
IGR0X2JpbmRpbmdfY2hlY2sgZXJyb3IgY2F1c2VkIGJ5Og0KPiA+ICdhZGRpdGlvbmFsUHJvcGVy
dGllcycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQ0KPiA+DQo+ID4gVGhpcyB3aWxsIG5vdCBjaGFu
Z2UgZnVuY3Rpb24sIGR1ZSB0byBhZGRpdGlvbmFsUHJvcGVydGllcw0KPiA+IGlzIHRydWUgYnkg
ZGVmYXVsdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcu
eXVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hY3Rpb25zLnlhbWwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FjdGlvbnMu
eWFtbA0KPiA+IEBAIC00OSwzICs0OSw1IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAt
IGVudW06DQo+ID4gICAgICAgICAgICAgICAgLSB1Y3JvYm90aWNzLGJ1YmJsZWd1bS05NiAjIHVD
Um9ib3RpY3MgQnViYmxlZ3VtLTk2DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBhY3Rpb25zLHM5
MDANCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlDQo+IA0KPiBMb29rcyB2
ZXJ5IHNpbWlsYXIgdG8gY29tbWl0IDYyMjk4MzY0YmQ0ODliMDYgKCJkdC1iaW5kaW5nczogRXhw
bGljaXRseQ0KPiBhbGxvdyBhZGRpdGlvbmFsIHByb3BlcnRpZXMgaW4gYm9hcmQvU29DIHNjaGVt
YXMiKSBpbiB2NS4xMC1yYzI/DQpZZXMsIGluZGVlZCwgdGhhbmtzIGZvciB5b3VyIGluZm8uDQoN
Cj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQoNCg==

