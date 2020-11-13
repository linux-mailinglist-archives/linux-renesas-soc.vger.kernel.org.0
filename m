Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8FA2B15B6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 07:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgKMGAz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 01:00:55 -0500
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:48153
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726083AbgKMGAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 01:00:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPAjeAiFw27U5GYOyYnqZDuPth+NHCPIvIO2RSfx2CIY5BBpzWR1bkhujS+lA2byeY2j1lv4m5nC4lg9ABjNPJ+VsbHQig94slavDYu9/Vq104vN1UWavIpX/rCo3yxVXPEqP5GclJ11MpMk8jc3m2brFTgQlgECHl0n5EvqfN6TBCQ27NwTEV12ChmuCQ+geR1r3Ah4iSHDO/y4+MU4lEzPszY7JbWweCWPvsHXNspzfdILt83K507fOfvsvJXT8BLkQf2lRxE4ZKX6/0bO8eGv55b5GY0V70bT051QBt/6Z2dF/oMEZHDW54N85dtnPUB7mt+9KSBagYGvx26Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fweZZQ+sj2IIP/GAXCC8mYqxBoBCoPBgPwUc3UrdBiM=;
 b=XvAfoNIelvH6x6CL8bkOAQGXw7IbLE95ECffg/VehnFFpxYXJi+FSAEC2li32gLED7nI1cd5uLKM6iVoRKuPXLwjRtg19Qj27hns/zKeY4fCpE4ZAGh7deNC0boQnu6cnfH/92HOAEVbDdiLZD8/axHAvhJ7Ihdc3Sn9A5apwn1GjrpXRAjtZzoNU1jao7FIOs6Cy22V+w47oCBST5JBHc57i60f3b+sqy7w9eVdMqOduDU2G5ql0hD7L40wYOwThXE7y1SEBkwi4SbY1pWeQVkYu6XTouWXDcdHstiAffcZEHMb2JiEMNzsgXyadfNDvdtFx1PdXEIDynp0/mkvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fweZZQ+sj2IIP/GAXCC8mYqxBoBCoPBgPwUc3UrdBiM=;
 b=WMRjeIYu+z6piX5fimEOGL2e9d9pG6qmvIHo18g3fsKLefl/5VM9Bix2FW01oET3Pv9MmWnFQdFhrowHnyyB+VWJIPVfrWXdpg1J/NmQ6qHSYfxRd4Xyg7tFKarjR6n5+BYiQ7qngD3QXsCGMughC+pMDXjy/hXQeooPBKMUjgU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 06:00:52 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 06:00:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: RE: [PATCH 0/3] mmc: renesas_sdhi: generic cleanups
Thread-Topic: [PATCH 0/3] mmc: renesas_sdhi: generic cleanups
Thread-Index: AQHWuBHVyty+9HGMTEKdmTI7sOk32qnFkzQA
Date:   Fri, 13 Nov 2020 06:00:52 +0000
Message-ID: <TY2PR01MB3692C1080F2000A368FDECCED8E60@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:19d0:b06e:df1f:82b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e07cb9fb-9ec7-4cf7-616f-08d887997a62
x-ms-traffictypediagnostic: TYBPR01MB5391:
x-microsoft-antispam-prvs: <TYBPR01MB5391EA5F4522C9A7EBBF2255D8E60@TYBPR01MB5391.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOkCJmg5nmc/egdKu1FwCNcM2NZqbg5sfBiytvjGejfo5aZ727PzUvIJyFwWMnorg+/uHrMjYLBpqAVS7wLgL/WQBNJOHZOc35gX0fZ+7lBWJwJ6yYSCo3cCqUMdom8C3HFNglKtQxUUPLDfwfGQNKlgoaKxsxWkuQXGn6LNQ/VCBRTLaCPhbxhhT4FiSuif3qDmjJhnVwTE9nUEnl38Og7IhpfGCOrhB4SV+i5EoVvAuJbM4/FJidSQ24zw3xMiP4XlvjI4LVcxcaXG1dtpmN+6pgUKZEf09Rq8rv5dTkhOt1LnUPWCJJpTknw1LNLX5wRE/mVj3psNdGVxGFzf9m1lCIJAoaHkI+o6UpLZUqYaeiHz+VbZeaxxEwoG5ZI0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(9686003)(71200400001)(5660300002)(4326008)(55016002)(66446008)(86362001)(6506007)(52536014)(64756008)(186003)(478600001)(7696005)(2906002)(66946007)(66556008)(76116006)(316002)(54906003)(66476007)(33656002)(8936002)(4744005)(8676002)(110136005)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 4TZqR59zlGMQNH9CGNcxRIafO5AaShVu3TpsKJ875yUmWP9LRToFJpKmbDMJxVz9qvy3AyJXDrzc48DMMCWy/pC0J0J3J707dCYnPWdWS4iGFM/fb/KoBWv+JO3vsRQBR/sgpyousCIEuv7wBuNB96wdkQrjZTIoSEJwVs/f/BpEuaxJU1bOLXBu9e3LGoEZzZkM+ESnZ7tLPASW4KdXRQcGJhUamthCTlHYmKIFZl6Q7oetsWSOqEPiTrQxTijr+VxETmx0iZjzTMDXL810gVVM7TTsz4mBbLBD0dnS6F/Y2X5z4TowrYkU+2r5BslP0Nz1eA7m3Pprnc75xHdHxrEzQtFK047wnTMus08zhOavIE4hWWsZ10nFpJiIgZnkUfVluEDlw5CFYQD8BYefhjjBH78EHtMFn/qUNDLhRpCY76VLRTMh3TC640XGejpty9LctSEfDKbGYOCJ4Bn321hxWlVh4QSZl4Lt57bZHsTQVq4DWr4MzJXSecKVeuA0xvylGA/8T33dDa8ot/1ehK4fhmisspt8Zowhfhxy78knUNMscUcNZ3iCm6H/8QWvlqkHODEQXz/Kqg5/C6mxfj/M3jZr58X8/RbNmJJcJ63eqZEbMAd/ieTaG7WQEAq30RFwcOoFKRdArmoC6ziTYtDjuvsHVdK0ZvYlSiIWPi8/EpnDMEtbi/EjXr8aYNL5rH99bVSxLy1oYpBEx4hvug==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07cb9fb-9ec7-4cf7-616f-08d887997a62
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 06:00:52.4669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K65wmQCHZCQ+QPZebaW7nh4KSdSTr9W9CwRSAuQmKSoisazt6n0gi5R+HgxZYqffm0azfOF2jK4tHrinQEnYYdq47/AUgDCvpsHWa09YSJkpj/YhU1HWQI1La/kLVebc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, November 11, 2020 7:03 PM
>=20
> Here are a few patches fixing cosmetic issues which always annoyed me
> when working on this driver. Patches #1+#2 improve naming and remove
> hardcoded values. Patch #3 sorts the defines. The object files were
> identical here before and after the patchset, as expected.
>=20
> The patches depend on the series "[PATCH 0/3] mmc: renesas_sdhi:
> refactor SCC reset" and are part of this branch:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
tap_en_v2

Thank you for the patch!

Since I intended to reply on the patch 2/3 with my comment,
I sent my Reviewed-by on the patch 1/3. But, I realized the patch 2/3 was a=
lso OK.

So, I sent my Reviewed-by on the cover-letter:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

