Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832951813D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 10:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgCKJAu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 05:00:50 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:16928
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726934AbgCKJAu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 05:00:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5ZmEOK+StPJyq7huimTGSSFmVeQgaA7OcQqhpgPiRmSe6WnPcVtFcN4l/vPQe37sGrS99oKftL0MYR3MvzmOwty3UAZbN9d66UevWgVr6dkCVPWBMK0SkDtoPVpsEyv30wUrDUuO7OulYv4yOGcm8zwB5bm9F9qGupAu3wFPV5nfnwqMtygTELd/7hh5jVBAz8uqLXxW3SC4upf6tpHMs1yZIa9djpPmVzf24uOHe+yWZhL+NrEj+9aWF2Q/zPAsFUNiZBdnbCK0kcbSP6K9cK17rx7VMhd5r7yhzrzBE8gHLOTWFFahk48wTNrflR8m0eCGw2iHEVhXP3kr36bGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zln4OoNiNEXXwravMAjlm1KSBvLo1eKdV1VgpUS63h0=;
 b=hUZ/5r6BHdRHmLFSXgIVBqc+j3nYeMYHOY2ouCl1FJtX3C14rLgREng5wgV2H3hXWyCyCTI3eA9yMrmBNmt18gBTjJNe0tRLERybrAOsN1VimH2xueUTjdA0Bp52+qTZ2g7Z1shV232pgmpTAszFID+LZLkP3xOwZ1hdU3gt3LfYN5aKMzMV5QXXUHaiA5wzPGdaT6TL79E2rPCeXNQN3EhfNlaTvhpSBKuD7PABH57OE86KBQQiEtgD4B+d3bSdY9dCyPpLyAkKB7XPS6IFyfbOc8mJMAkk1pyDMlYL/HQYVn5Ahmnjww+slJyNIBjwCEqZhdrxVWGPlrK+4x+JNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zln4OoNiNEXXwravMAjlm1KSBvLo1eKdV1VgpUS63h0=;
 b=sDJzE2Rgh2TVa9i2K5Isl+Dpr4hgrnPYDsEHrFpQ6ByEWagnJwJEwkiABMmIaaVU0XwFl40FJoWLKx4FpJ9ez3nFTkYTIjdIjxuWiXO/xN12ImjKAkgmk+zEVHP38Zz2UHR4oIgZdwZ39vJwRjJJ2wH4f9Gh7tuIp7kQy2tIZLM=
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com (20.179.179.149) by
 OSAPR01MB5026.jpnprd01.prod.outlook.com (20.179.176.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Wed, 11 Mar 2020 09:00:36 +0000
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092]) by OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092%7]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 09:00:36 +0000
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] ARM: dts: iwg22d-sodimm: enable LCD panel
Thread-Topic: [PATCH v2] ARM: dts: iwg22d-sodimm: enable LCD panel
Thread-Index: AQHV8VmLikl1aT7kWUuhJYvi5TqQR6hDFmMAgAANdMA=
Date:   Wed, 11 Mar 2020 09:00:36 +0000
Message-ID: <OSAPR01MB5028294F73FFA0D31DF7F53DAEFC0@OSAPR01MB5028.jpnprd01.prod.outlook.com>
References: <1583239490-8837-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <CAMuHMdUO1OMhGuBK5Q-CxB2gta3c7K4yuOW05hOw6xAUfRD7vQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUO1OMhGuBK5Q-CxB2gta3c7K4yuOW05hOw6xAUfRD7vQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marian-cristian.rotariu.rb@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 89b01c92-d719-4d18-c00b-08d7c59aaa1d
x-ms-traffictypediagnostic: OSAPR01MB5026:|OSAPR01MB5026:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB5026CA8596C784069A57DBAEAEFC0@OSAPR01MB5026.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(2906002)(558084003)(76116006)(66476007)(66946007)(66446008)(66556008)(64756008)(26005)(8676002)(33656002)(71200400001)(4326008)(86362001)(107886003)(52536014)(478600001)(6916009)(55016002)(5660300002)(316002)(9686003)(8936002)(81156014)(6506007)(54906003)(81166006)(186003)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB5026;H:OSAPR01MB5028.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IDmxqzUq6+ai6H0xLkrILOeeSisEXNdD6UCQfIgJQQcelSj3PqJcrgA14R7EaIDFb6f7p+WMaRspbDJ/CUMsYFRHGd/VVwbBDhk7Qon3JeHcLs2U8ZDktVJUIaWAH2gEi0ifh5DGs3sUZTlaSXLv5NFGeIelToosgHurNxQeLGcFvkECOL/dhs67lTEDJk09GceZnWBQ8PpgUCU9plsLxvAImYhlbFkQ0nhoDxEcoFEnxbzzqnVD3glj1bqfXMHelkgzH5AO8HN1dPfJbBMB2LZErQoFxUVxn/FAHUKeswf7uGt516Zitl9qAcYfuSN/H552fKbW1D8AGDpKbUG7BtDiaw6j7KLFRMPIWNVAB8Dh3XIub5vcBhlhv/Iq+dIeayC6opHX0JYP30pdMpzrlzCpcMxQ31QSEMUd2ZPZpqFVGH5Jesa2BdTtPSfF2h3H
x-ms-exchange-antispam-messagedata: Ygnx2BtM6kn4Zu/Hc8jA6IRn+hw/+i8MmGcnnDDbgFqqSpbu0eV2/z9HM+bJY5JEHmkp3ND8ZwjADVIkANNzroJZOqzvKFue1iMHvQFNeomDfVMmovaWKU40AOIjmXuhd+vPRm6NYtQWzOE3MyXyVQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b01c92-d719-4d18-c00b-08d7c59aaa1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 09:00:36.3447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuPNBeK2sSZTIoc5hse7OdHp5FnalsQ8AiAEgO0XqkVQNGdqIle1cbrMOtNdweYA0gmLVEtZOFp+3VEtJH+cpmesIsoYNtP9WTVzFAEAvW4hIoestCPf0g2L7tbipsH3CrcRRn1OkntliYbbjArJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5026
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBBcyBkaXNjdXNzZWQgb24gSVJDLCBJJ3ZlIHJlbW92ZWQgdGhlIGJvZ3VzICJyZW5lc2FzLCIg
cHJlZml4ZXMsIGFuZA0KPiB1cGRhdGVkIG15IGJyYW5jaGVzIGZvciB2NS43Lg0KPiANCj4gVGhh
bmtzIGZvciByZXBvcnRpbmchDQoNClRoYW5rIHlvdSBmb3IgZml4aW5nIGl0IQ0KDQpCZXN0IHJl
Z2FyZHMsDQpNYXJpYW4NCg==
