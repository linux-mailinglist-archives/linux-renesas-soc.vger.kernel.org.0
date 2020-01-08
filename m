Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06305133F24
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2020 11:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgAHKWI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jan 2020 05:22:08 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:16842 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726368AbgAHKWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jan 2020 05:22:08 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 008ADnJ7030854;
        Wed, 8 Jan 2020 11:21:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TYfln+0XXf027Uy3uDGknh/wr9TsRfllIQ1i3R7P5zo=;
 b=jIrcwa1dSelJaj4xkAqslSzeRCcLNKu/0Z5fUDjkk67spLfeusQnw+ggVtFaS+pqbavs
 PMD0cW0haTYwmVxzWLYdfnwn4rSfWoYsFsw+CVjA796y9mr9n2p4P8893orUwdLvvQhn
 liEcJvods6TfY86DEkVa9WKTFjLKJpZoGL/cH8ViMaEMLxYa/aT5mJ7dTHnOKed2coxc
 lnLcM9n8oqanfg+bsd6JeBDgtJ+Fndpz7RY53EEqKpsQ1ClPM7Wt1ii6c3zjG7tSJJDi
 GSZkAV31T5QkmKWBcs3PRnUiFTzyYc/WutrZFqpveMZMwnP9kfwGKT9b9Cg9hk+Nymp7 Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2xakkauetj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Jan 2020 11:21:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 033B2100038;
        Wed,  8 Jan 2020 11:21:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C92022A8A6E;
        Wed,  8 Jan 2020 11:21:46 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jan
 2020 11:21:46 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 8 Jan 2020 11:21:46 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Linux-ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: stihxxx-b2120.dtsi: fixup sound frame-inversion
Thread-Topic: [PATCH] ARM: stihxxx-b2120.dtsi: fixup sound frame-inversion
Thread-Index: AQHVs7XByhrpIEFc6kCeIo0ELQ1dwafgoquA
Date:   Wed, 8 Jan 2020 10:21:46 +0000
Message-ID: <e7ae8519-9b19-a23b-8743-9a2ab6da5919@st.com>
References: <87lfrd3tu8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfrd3tu8.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <87E319AF7ED09A46AC66406E93AFC4BD@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-08_01:2020-01-08,2020-01-08 signatures=0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3VuaW5vcmkNCg0KT24gMTIvMTYvMTkgMzowOCBBTSwgS3VuaW5vcmkgTW9yaW1vdG8gd3Jv
dGU6DQo+IEZyb206IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5l
c2FzLmNvbT4NCj4NCj4gZnJhbWUtaW52ZXJzaW9uIGlzICJmbGFnIiBub3QgInVpbnQzMiIuDQo+
IFRoaXMgcGF0Y2ggZml4dXAgaXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmlt
b3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4NCj4gLS0tDQo+ICBhcmNoL2Fy
bS9ib290L2R0cy9zdGloeHh4LWIyMTIwLmR0c2kgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0aWh4eHgtYjIxMjAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0aWh4eHgt
YjIxMjAuZHRzaQ0KPiBpbmRleCA2MGUxMTA0Li5kMDUxZjA4IDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9zdGloeHh4LWIyMTIwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3RpaHh4eC1iMjEyMC5kdHNpDQo+IEBAIC00Niw3ICs0Niw3IEBADQo+ICAJCQkvKiBEQUMg
Ki8NCj4gIAkJCWZvcm1hdCA9ICJpMnMiOw0KPiAgCQkJbWNsay1mcyA9IDwyNTY+Ow0KPiAtCQkJ
ZnJhbWUtaW52ZXJzaW9uID0gPDE+Ow0KPiArCQkJZnJhbWUtaW52ZXJzaW9uOw0KPiAgCQkJY3B1
IHsNCj4gIAkJCQlzb3VuZC1kYWkgPSA8JnN0aV91bmlfcGxheWVyMj47DQo+ICAJCQl9Ow0KDQpS
ZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0KDQpU
aGFua3MNCg0K
