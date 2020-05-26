Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE981E1F24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 11:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgEZJva (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 May 2020 05:51:30 -0400
Received: from mail-eopbgr1320137.outbound.protection.outlook.com ([40.107.132.137]:30064
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728750AbgEZJv3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 May 2020 05:51:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar8P3AzbqMYxARRjB7gTgnjPGMLuc/Z2CR/dSEHk+00n1i8OtyF1ZaTrsG012Ttpx+QRsbxSub5uV1EV6tm2O4iVPb3fF/ZiLfcojZgaOdmz56aDUpXJWdpZvIkmJFC8h1LQZKuvMaI2NJEMgTKYAn/40UbBTIzfcRm5o6FThNqlAq40hXuOYyphpcs1lih/4NcI/IC27eH4ffsuabT2zjhpH2IebTP1yLz/1zG+oEhkXJspSHiYRh1oe6sJqwjVsb0kd9HEv4ZpaglFSzCGY6Blp1kPwSslvJ2EJTkmpSvbp6O+PKFrpIgrk+Q2vHKwT0ZTVjPaFtOecVQ2gr4kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ojqV+IdoF/eXDLxt4SzixRbcho7d+sT3QiND9hLjt0=;
 b=AFIa122rvEBwcpkQC4iEinW87NtUYXz0uEnPZ4P6qSiUdCyr6aMLZd54F4cQSUw96+r3/+d3ph08jmB5vwBQOQk4Ad/dw886Nq29diedY1xBqKVLzGzI8n5EotQZ1iBaWK3qkNJcGS87C9C1hZo5S2TLO8CKf21P5yhXBi4Cfcdejfu1a8x2eREFCDiAlR1of3wD7Jf+GODoA47osTg2+QjZPNAIDMUAH5X1tRvrslL+T7Mt0T+4+09ydA3hjxcIU8v81P60Amg4Ml4Cz+3+O42DmnYV4YZPcfuzKn81DmmJnpVXPhC1yUBrCku6vN5JaqLDHTkfyO8MwEIR+0RPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ojqV+IdoF/eXDLxt4SzixRbcho7d+sT3QiND9hLjt0=;
 b=swAAcuIGYWULPfmKInp6VcemCwArroQJF/u14avj79o13JZZcvf69t2iDCSqfTs2zj15G0LFCwDujp3QZR50lfVwZ2KTiTuN8B4/DvP4KINOuO6VcrOIfww3Iq+iaJ/fjhLEyyHWv7r3Ng89A+uKkAvKG0nAmwH3mcEc9pZXshk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2139.jpnprd01.prod.outlook.com (2603:1096:404:b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 09:51:25 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 09:51:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "Shashikant.Suguni@in.bosch.com" <Shashikant.Suguni@in.bosch.com>
Subject: RE: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Topic: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Index: AQHWLNCCMO5ceqzAh0qZ614nN0icbqith5GAgAYRLtCAAGB8kIAADDwQgAYmSSA=
Date:   Tue, 26 May 2020 09:51:24 +0000
Message-ID: <TY2PR01MB3692E739CCB3D1277A84BA52D8B00@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200518045452.2390-1-dirk.behme@de.bosch.com>
 <41c79682-c707-d393-57d8-954586f81ab3@cogentembedded.com>
 <OSAPR01MB36831809AD6F3D66F1F39670D8B40@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <TY2PR01MB36925ABE9432E3F15EA778E2D8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692A45D81920C73C38E0E2CD8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692A45D81920C73C38E0E2CD8B40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5477876a-4826-413e-f5e1-08d8015a5a82
x-ms-traffictypediagnostic: TY2PR01MB2139:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TY2PR01MB2139B1382CD403A9471BAF44D8B00@TY2PR01MB2139.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NRjzntWvU4XaTnwUNwe1IV1OJpFAbaaklQ/Q/VfpNUFy5xjaIj+aipn/1eWtnw0NV1dkh96pMwnVuSuyiYCFOOLPWDjWI1ho22BxybxYtupo37cF6mZBMqrM0l+Uu4XybWc3r4cuN3U+akjiSIgD03P3WCH13Xyfe7fqy+gTfWy+LI36FisVDJRzVihGscHAEmb0e+u68bHBcUISb3m8+z+OcvYqonOfnnXunrC2aX6dNP7HvFTGRICqSGEYICDTlz7FWuJN/v7upqxOzSTu0uzSfG/h4k16HcHj8LKsjLSREECQaFObrdLdLwKNiLmZ6P5mMDe65dCSDZzf/mxaCvkyzJ1SUFdvsVFEsC7f6jh+s68AwjhEJHtM9goqWDn7fDHXZafZgWTTm+d5b/vmmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(66476007)(52536014)(66446008)(66946007)(478600001)(66556008)(6506007)(86362001)(966005)(55236004)(76116006)(9686003)(2906002)(186003)(5660300002)(64756008)(316002)(55016002)(107886003)(26005)(8676002)(8936002)(33656002)(7696005)(71200400001)(110136005)(4744005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: lHqdw0PwJyTGPHJcu315nlF6aMBwT9ce2/nMuhG894eKp9dGbC299Ub44ZbO8YFxNruVoP9S+o/A+4urimbn3ewV1oc6ugoBXq8qfegLBbwSm3o08kbAPy0ZurfZZ8pZguyet0hLAhqlFdQBNNaRCzm4WEGcCkaTVepZg6PAoWzqNH3uQhbzq/wKmLe3aYhOWnaMhHoFlrAGAa07yO6BLfdAErNj57csMhu77fWxauJm/TePwGmn4HqcqCP+uNU900YkkUUxbTOyoXL3BVc+DeVaXudmOUU0M+6U4cc0SqqNuKmcEHu7SgOpB5xMCqhFXKRAzWDkkJBbV7HLd7lR3uqx1Vbk1pikX19zfgUz0xfENQWWjhdxpGNNnlwz13Yjb1sAQfFJm8Cf0Bo+Cl+ZevWRExgIE0Jb+7EmsPLhFmKuQ/G7raEp6W6pri8jQ4I0FLIZD0BZD0yKEdB1j+PJ83cysiIyiTA9jldfLZTdZrz8MiIK7G/J2OK+PjPHu5Hj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5477876a-4826-413e-f5e1-08d8015a5a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 09:51:24.8742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gOsVr3PJcxBAbGrK+yX5YXZD4X7K6djAmT6I2iCibaXJEzUrrMTv/xTK+jlJr/SJWI5YjXrNHa27kAFEYqYkl1XQfxgBAFCDp46MBk6BZq1Tr4CyF86MYvhIbaDr3Mgr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2139
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgYWdhaW4sDQoNCj4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IEZyaWRheSwgTWF5
IDIyLCAyMDIwIDg6NTkgUE0NCj4gSW4gc3VjaCB0aGUgY2FzZSAocmF2Yl9zdG9wX2RtYSgpIHJl
dHVybnMgd2l0aG91dCBhbnkgbWVzc2FnZSksDQo+IEkgdGhpbmsgbXkgc2NlbmFyaW8gaXMgc3Rp
bGwgYWxpdmUgd2l0aG91dCBhbnkgdGhlc2UgZnVuY3Rpb25zIGNhbGxpbmcNCj4gYmVjYXVzZSBy
YXZiX3Jjdl9zbmRfZGlzYWJsZSgpIGlzIG5vdCBjYWxsZWQuDQo+IA0KPiBJJ2xsIGNoZWNrIHRo
ZSBUQ0NSIGFuZCBDU1IgcmVnaXN0ZXJzIGluIG5leHQgd2Vlay4NCg0KSSBpbnZlc3RpZ2F0ZWQg
dGhlc2UgcmVnaXN0ZXJzJyBmZWF0dXJlIGFuZCBpdCBpcyBwb3NzaWJsZSB0byByZXR1cm4gYXMg
bXkgZXhwZWN0YXRpb24uDQoNClNvLCBJIGhhdmUgc3VibWl0dGVkIGEgcGF0Y2ggYXMgUkZDIGxp
a2UgYmVsb3cuDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNTcwMjE3Lw0K
DQpJZiB5b3UgaGF2ZSBhbnkgZmVlZGJhY2sgYWJvdXQgdGhlIHBhdGNoLCBwbGVhc2UgbGV0IG1l
IGtub3cgb24gdGhlIGVtYWlsLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo=
