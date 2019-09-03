Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2134AA6062
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2019 07:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfICFAF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Sep 2019 01:00:05 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:50880
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725839AbfICFAE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 01:00:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7fbkjlp64I2ci5WUGUJKHqyBkD7alG2kg+OGRg3U8hCv2sepe5Q0tLeBRDPEat8OqmAl6m6PlGd3OlFEXCoVLCpeQks/iQ2/ab5vzrVLSxqmtPQ2DyNxzXXLEued9aVwnPoW4ffc1BsU5wWpPGoauTUS0t7H6y0Ipcjmccp40AGzJvHwqsk4L+A3jrXi4iDlJJdZn4XsDJmdrfOMbqpIjCUMYFiDKvuZeD57Mgh2pRxO88jVPUDyb+vjrtvzeXJWS6A3mqYWClBp5EssogQcNpZnieeuCKB7rvSIfiNYR4R/QB5UgFHRFFbb7AAQZwhuBE1S9GAOmxvA6nsprHwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXD+SBckSe+Z8yo7gtaaBVi7lWWoaPlWlwifIMxq6/U=;
 b=O1ra65j8G1xZgYBinbDgTB/wxPuHAsjowGRWrRx0q1uILcB8R7uvCE8wONwgESrhMnZQveLrvd/nSSZoHYlVTQF2JPBYUt0TQeeBHGNOfoIVoA/gr9NbSYc6TbRkLGRCTQMYtchplMuZF5KBN+L4ttIBaQEHXK0pDjVmj+IZxH1pjnb9w4BsyEe9KD9x7L5IcoABAS5ZVNUPmtprrUlDt4nhu3p+hCx3ATKwkJb0mXIhaho5zaGG+SlCQGpGOKsQo89ZOBqlyTHOpKkF3soIba2wkoP0yMSy8rdvFYd2EChAqEGXs05Cy6EAdzbSKM/dfIHX2cfuCMocNWGD89/w/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXD+SBckSe+Z8yo7gtaaBVi7lWWoaPlWlwifIMxq6/U=;
 b=USjzy7So2BlzN4ieuZLaLDXvMzBGWCP7hVwBWWsKfYXTxau4VUrzYRO1CDnjFkxL+KDyd1INgwmiy60YKFNDNCpW8XOKUy2L7BaR8T6Qe58iPUQ6F2o+DrIh3xst5KwzUoo3XF6fuwspul3aZdoeuwqZ/8vw2+u61Nwvr7ikrPw=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5261.jpnprd01.prod.outlook.com (20.179.174.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 05:00:00 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 04:59:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "hch@lst.de" <hch@lst.de>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "joro@8bytes.org" <joro@8bytes.org>, Jens Axboe <axboe@kernel.dk>
Subject: RE: [PATCH v10 3/4] block: add a helper function to merge the
 segments
Thread-Topic: [PATCH v10 3/4] block: add a helper function to merge the
 segments
Thread-Index: AQHVXZ1a3dgM7EWWT0y+9VldzhpkbqcY9KsAgAB3rzA=
Date:   Tue, 3 Sep 2019 04:59:59 +0000
Message-ID: <TYAPR01MB454492ADBC8561C0BEC6F449D8B90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566995743-5614-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566995743-5614-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <e549e8e7-9dfe-6f68-2148-f49a9089db37@kernel.dk>
In-Reply-To: <e549e8e7-9dfe-6f68-2148-f49a9089db37@kernel.dk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c23cddcb-a146-4b0b-6c50-08d7302b92bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB5261;
x-ms-traffictypediagnostic: TYAPR01MB5261:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB526160FEDC18B4A092612921D8B90@TYAPR01MB5261.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(189003)(199004)(229853002)(6246003)(53936002)(6116002)(3846002)(86362001)(66066001)(64756008)(66476007)(2501003)(74316002)(66446008)(76116006)(66556008)(66946007)(11346002)(256004)(446003)(6306002)(305945005)(486006)(6436002)(9686003)(2351001)(7736002)(476003)(7416002)(33656002)(7696005)(76176011)(81166006)(8676002)(81156014)(1730700003)(14454004)(71200400001)(71190400001)(478600001)(55016002)(5640700003)(5660300002)(6916009)(54906003)(966005)(8936002)(102836004)(316002)(2906002)(52536014)(4744005)(53546011)(26005)(6506007)(4326008)(186003)(25786009)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5261;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ADt0wtdOc96t6xdi6ndL0r5U1Jnl7o87NW7u8VLzwU8sAwtI1aS1rDtcBOWItnJo3ywnnAH7m36FFuQiAuK0hXsevUlHTpCHfVSZ/W6mFgPE+GSB7SuLGXFOS/AygMCEyBcbH39NIRs3tOn5sJBC16nUXihvV9oLxDBbKSzPtPToddDi42Chnl1Jimh/hs/sQsX8IeNAF6Dz9O42WD1z1xCGIiMcfEXuXBNthQ3pqBKFVE4RRJPzRdAG6QItYb0+XVU6uqJLMiDnqSgHEVSmB2CoDt4c631mICaBrnCRN+DG8PTGy69ZLAkiurNE4i5WShm3hyIgQ9qnoExijmTw86W/TXVUPpUqVBZ16qDwrIrcUAFOQ/Q6kr2p4SvI+jKU6LlzE6LBM0+4AFWrzFXrFdXSksgxhIFytxuUByM8WNA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23cddcb-a146-4b0b-6c50-08d7302b92bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 04:59:59.8261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /B1qWuEj4szLarxo3RBa6I3dAqvyf+WiQNqAmIjjWgyPFmvo5UjZz2UvMNAojJgVnzbMRdzBWu6q23woPKvPggz6gmC4880S+hr9TqYhVnWGejDXWHX1JTvGjebKmJmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5261
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQ2hyaXN0b3BoLA0KDQpOb3cgdGhpcyBwYXRjaCBzZXJpZXMgZ290IHtBY2ssUmV2aWV3fWVk
LWJ5IGZyb20gZWFjaCBtYWludGFpbmVyLg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJlbmVzYXMtc29jL2xpc3QvP3Nlcmllcz0xNjY1MDENCg0KU28sIHdvdWxk
IHlvdSBwaWNrIHRoaXMgdXAgdGhyb3VnaCB0aGUgZG1hLW1hcHBpbmcgdHJlZSBhcyB5b3Ugc2Fp
ZCBiZWZvcmU/DQoNCj4gRnJvbTogSmVucyBBeGJvZSwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVy
IDMsIDIwMTkgNjo0NyBBTQ0KPiANCj4gT24gOC8yOC8xOSA2OjM1IEFNLCBZb3NoaWhpcm8gU2hp
bW9kYSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24gd2hldGhl
ciBhIHF1ZXVlIGNhbiBtZXJnZQ0KPiA+IHRoZSBzZWdtZW50cyBieSB0aGUgRE1BIE1BUCBsYXll
ciAoZS5nLiB2aWEgSU9NTVUpLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEplbnMgQXhib2UgPGF4Ym9l
QGtlcm5lbC5kaz4NCg0KSmVucywgdGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
