Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E60193B26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 09:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgCZIiQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 04:38:16 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:41156
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726210AbgCZIiQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 04:38:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuSBIUDOrQ0DMBWF7GDgwFhzFOhO5XS8z6A3TpjmU/XF5tDAVkhAInKKT6h/S1439RcR+cYovGx3Vu44EjummKNnnXiqKHLeCOT1sv/kEhpsh9UrIwoH6MQae26wvH194mLkY+GN3hBMOoDBkqv1NfgOkxne70z8ChWHciEtP4lgVcgYG9VoaVrfV/EfhnLGBkDMZd3qqYMkq5VGquKP2s/wbibM3EyJRxT2gHPtIYUur61CvIcJpf2HLodDGMEjtf3SbgDRtPSGF/CejVZu49RCKVwY91OQ1vZLe63V/R/7ETk/5+VYDseyF6faj05V0vsOwuXu7hyhp85upk1cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sYLkeWg/bjS8C/VwKsTSYSK+5EB6M63CuIn7w2gCn8=;
 b=XhSvZa40927/lajgmeYoiUc08uTQKoQEdJzJtX6ryHJMZRaz7uSUXFiGnFCgWv0xJ/vbWF6DhdwxKtv91Uinj4HkHrIQqxnh156WY2oR1Oxb/dZ2zb3jIds7Osk0/RGb53N9EPxd5+omQuXCRRsPlLrmfveVafOy9LEgP9nS95PmZTlQ4JeNReBQCA43Nu95wUfGDDM4COV928R3jJYAmGeoTLsLcyWf22rn/3zgt0nyQf5jHYhzNfwK/g5RG/RFB/ykGgQCEFUIcvRGknqMAYz+JpR4/zJlZ761X3xdxyrnamHH4KlTTR8HoMfhYoLOWl80xyAdrdYAgQUYeZ8D5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sYLkeWg/bjS8C/VwKsTSYSK+5EB6M63CuIn7w2gCn8=;
 b=cit1LLkb5VlwZAdQVb/OOOFe1yAmLUwNvCTTP5LEPZqyqovb5838315Sr9RdGhG00ZCU8AfnjEuNnb28zq2iXt/DfgwakqvIcJxBAqIoP52XPqUsXMVwxfX7La53klmwYFgnhPf7J97YyX8LHJpKEU4ml7OUoT5a3oqHrK+21vw=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB1997.jpnprd01.prod.outlook.com (52.133.178.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Thu, 26 Mar 2020 08:38:12 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 08:38:12 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFT 0/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Thread-Topic: [PATCH RFT 0/3] mmc: renesas_sdhi: improve TAP selection if all
 TAPs are good
Thread-Index: AQHV85ocDYPSQmJFaUynJAqGSQxpTqhaqovQ
Date:   Thu, 26 Mar 2020 08:38:12 +0000
Message-ID: <TYAPR01MB4544095698FB020DD81FD2B9D8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 28087294-4598-479b-7457-08d7d161056f
x-ms-traffictypediagnostic: TYAPR01MB1997:
x-microsoft-antispam-prvs: <TYAPR01MB1997917A255A53683D14F4C1D8CF0@TYAPR01MB1997.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(6506007)(81156014)(64756008)(66476007)(76116006)(2906002)(8676002)(66556008)(8936002)(55016002)(9686003)(66946007)(52536014)(55236004)(81166006)(33656002)(86362001)(186003)(4326008)(5660300002)(478600001)(7696005)(26005)(71200400001)(54906003)(4744005)(316002)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB1997;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HTe2JJMH3DuF0QdNv89sv5lwSMvrtvyZB6NC3BUnGr11yKnv53k39BpvEPZU3PsnCTMSfqBdbnCrZQz7zp/oIHYtdvF1RBzrZqSErFC/vK4otruJXDbUVkAIw7DQYBUSONK2nZdrj1hAPwrOq4IAqreWOjZ+BPIAovhhr44ANRDyicetY4FT3ZDctkB+V3IAMNtqm0j9kZx5sydtvjkU8hsHBRZDc4kExQeCFP4kK0E7kK/Desrjq1m39NCwM4DeU/XhDq4boUUXc0ecBFgjz4jGtBmELUp9FXC4Bi8TnLGffCHOWixhDPQXzSneTcGQGHdTqXXkdyzVg3vz2DGXsqtrLekzS+FB1R1g/z95LYKLz62SbdVNoiD8yPIZ3myjDuoQhKLaMdWPKh6eH+rC1GsSwdMxdDN6FrMPuS5yO8HrNsUyOrNFLqH6M70UJF5+
x-ms-exchange-antispam-messagedata: hkxivUTZhVrb9GOXA8Ip7zfsLHGVW/4RS1wDZnV4dxqrpDdG5DxOE32iGdbZKQ0qYYTUthyK/h0DjucOuultSA3uTlyl64ZG34RxABRBYr43MSTYw3sGcXmgFQFhVlaC7kFhbaYJD+1+YgfVLeNVtQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28087294-4598-479b-7457-08d7d161056f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 08:38:12.8198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkzRRB1tR514Kbc3PJssNtmDHMoU1vP9DpMXA5w6D8DRT/5zICnDUXn+8Hhi9P7iJuGPUsEly7Q8MOJSsVxKP8wkPEzOfS6v1N1CxQDh/CxW6utjzVxqzuTUkZPa9u8N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1997
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Friday, March 6, 2020 6:32 PM
<snip>
> It has been tested on a Renesas Salvator-XS board (R-Car M3-N). There
> were no regressions detected. HS400 could be tuned the same way, and
> checksumming large files still works. Note that I couldn't test the 'all
> TAPs are good' case without hacking the code. So, maybe the BSP team has
> a setup where this happens without tweaking? This is why the series is
> marked as 'RFT' still.

Fortunately, I found such an 'all TAPs are good' case board (R-Car H3).
So, I tested this patch series with update tap_cnt on patch 1/3.
And then, I didn't find any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

