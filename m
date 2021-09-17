Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8D540F21B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Sep 2021 08:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245045AbhIQGNa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Sep 2021 02:13:30 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:50361 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245205AbhIQGNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Sep 2021 02:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1631859106; x=1663395106;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4pwWIwym7o98wXHBmduIUjhkIFwtYaqjscxaJlcptsc=;
  b=ZtfJofsDgkTu1BPztGLiabuI7VcAa64KlzjFUTID/M7o1haJVqv2KRPg
   G4Bg3wD+iSD05py3112vADjKagL0NvSSxI15EOvcHlfZ/0kfT2RQvMutC
   bNOBTxJ0DEkoKG1wrwsy0NJzmSbar7fIIJKFVZn8yzz7wtMVfvRSMIXUs
   v/qcvAUxfpGeQpUDMABLqnX7jw/XyNL+szkyfLcfL58BSBb3dzm8ag29S
   vhUd+JKLirGio6/jip/a8WI4KXji45m25Rp4/scyjUV/rP2ovnbUWMg9V
   0TMJLX8h+lMgn6CMzB+oF7EcugKAuL6gJ1Eus537mDuQoJnoRh75OG0V4
   Q==;
X-IronPort-AV: E=Sophos;i="5.85,300,1624291200"; 
   d="scan'208";a="284038584"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
  by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 14:11:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1ogYCQlkzvnJ0YeYdb4Iu5Fmhvecsbwg3NGHrFJPYeFByCGvt9ZixLjqriOcSRlyaW7szxCrINkg8X0iQuo0b3jdJJG9epKOa6y7cX/Uxa+kjsMIOg0I80rkNzjtPfPn4Rmc8ff+JamUyBQQKgQYC5E088D05L3KR0t/UVmlUwmuCgTUUftyiocRZsIr9Y+UbGFqUD5y0+pDK5BkIdpuKRtLnDMibJkBwk20MIwbEsCLZPH2FIwudSDOU3K62TH9etC4joEx2z8XnNIjJ91qjg1JU9co+vRqRbEi16CKfsOt0z9RUoGKwiNrzvRDErpMNhgtau+1kRmGX1d6D7ycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=44u8o2+TBrKK6y0FcDz0Mcqe+zbPBcrQXk6RzYX3TBQ=;
 b=jrP58N+f2kU68Katpnn6n+N4hAoJ1BkYBCPfIRUyeGk2RbupVyZoCd0cO64i6oS0TdnRAIrXuPSjPcrgBryrMO3GH/mm+O7TSrqvrLw4YMHqP3lFWTvIVg7whQalu8RxR5IAvKYLtNxS8B+bRcdTh8HnqiCxZL0mB01n3Cswu1/+q8kuktzuQDhIQSzPgdEtc9hN1lcPJ9YnDZXsv4SJvPV8kRXP+vJwYAq5Z6HLf4iNsKpLH+Cd+tdwS+9WvyaChpEQPlOVj192J/JeHXuAz8A38zADSFMKCleSIlnV/XeR9lPz1r9lir8BUy7n5Wea6ogIk7RG7HrToDNLhN1E4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44u8o2+TBrKK6y0FcDz0Mcqe+zbPBcrQXk6RzYX3TBQ=;
 b=zXuUsegY4AzNNrv67j5qDmChoh91zpDBpw4+Tl/WbOm5sKchnQxXhgoYCGWE/cdlblWMIq7ZEZnGVuRkHzHbQmF5kME27CYuuqyk5DvcLGlRiBmPjktHOXygZNaLFHf0zgsOrk+I1VtxGCzyxD6ZJfCarkbpcLsgLi0W0bzSIe0=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB4427.namprd04.prod.outlook.com (2603:10b6:5:a5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Fri, 17 Sep 2021 06:11:43 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::edbe:4c5:6ee8:fc59]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::edbe:4c5:6ee8:fc59%3]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:11:43 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Thread-Topic: [PATCH 0/3] mmc: also abort tuning with CMD12 for SD
Thread-Index: AQHXqZVG8Oh7FORawU+mBqRxlXkhWKunvkbQ
Date:   Fri, 17 Sep 2021 06:11:43 +0000
Message-ID: <DM6PR04MB65756FA165B1263AFCE45B2AFCDD9@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 149dff86-e4c3-4173-6238-08d979a205a6
x-ms-traffictypediagnostic: DM6PR04MB4427:
x-microsoft-antispam-prvs: <DM6PR04MB442781F41BDEC5387DA7829AFCDD9@DM6PR04MB4427.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQg4+9iBZcPfD58/t+hfs1CElI/pTJCx7gugk1LXZm2cEbzrzAPCee3gySSBV9z3ccOTFTNEqOl4PqJv9fTzdyVJf2CJC+eTtKFvE7MK+r0nv200hDlO2JslME66eO89tg0+h9TqGp6ZErb2QTD53VWxIsYlEHdQPSAqxOFCBKk8/9c0klEdazyWhQ0e9xLVZAasCRUIklLTOErA/5BjRDALrcz4/lUPnWTflHcH0c8fN5zD9xeDQZ/J+WXY2jqKktBGkSL5dEgWaLCH03KB5kHrxR3yk8/tBSRnNMrbiOw9TKHdE7t0HeF3m0YKjyxju3wXWiim8ARXao5xMW2xLPRxRjwk/OH51TwN+9dMY2kJCPWz73XydNV9z9hhY6yahC3RFE0aIhtRy0LXb1vwUKHjpwnPOr4XIqHa5iY5LnpbL9au3qWIwqbkAoQAzh76UXFoJhVCPjGLsQB8iGbrSjNJbxlOStlSWcajGvAYHvcUxGydGwa566AAL/3F6fe0bMVENtaYnIu9CnXjIr3nJEm7jMEI3M8BbXssHGcLDdjGSACTdmzcAwCG27/Bz5kTUpwpIJ5PODgHeiSXYWt+iUEekQOHbVcOlwx/9oyusvDyJzD52qZuSeI5dqqf3QC00GumfwPaUYCQVq9uS5i8nLSbGxa6J0rOWwPZ3rG5es0thbLe5QZ4/an8ssfgjGjMUbQBKQahzPJayx1K0TZRhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(9686003)(86362001)(55016002)(2906002)(4326008)(38070700005)(33656002)(122000001)(26005)(71200400001)(83380400001)(38100700002)(8936002)(8676002)(110136005)(64756008)(7696005)(6506007)(66476007)(316002)(54906003)(76116006)(478600001)(186003)(66556008)(66446008)(66946007)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?e3hi9gslsN1GpjXhqy8KO2rgebLDMv+smGWHt+YnIvodRu4E2eCthQoaf8Ry?=
 =?us-ascii?Q?r8iXdAjo25U1Aew3wULr/wb1iHNWivl8/yU3i48YiAOANkWTLOdq1/Y/IkyY?=
 =?us-ascii?Q?DaJ7FR0ysl1wvBZcsCpycKUuQi/O/39AajGi5743pQW31o9A6inXbopMkyzJ?=
 =?us-ascii?Q?owhsKe0eOqwy5KtZr3ym2h7fWSikb6e2Atwevlg+L62wl4iuQZzKOiBd2O2+?=
 =?us-ascii?Q?dENrRCnvfQBDm6cgGiVLCPjNuvG553c8waSobhD2BOLs2JnM+kAscw17kBrt?=
 =?us-ascii?Q?cu1rrQES3G5Ee/P/Gh2bbMuGMzrw6Psgb+W3YOp0PfZrDgXNsVJqG+3qpnTT?=
 =?us-ascii?Q?BOvDPLVg+0fbwfQeF2pVugVvoBW+8usVAUHOkMp8LelAq6yIHxjU2WA1d2S6?=
 =?us-ascii?Q?Fx+yjOUqn4zekT+CCphBAFiRzBMiYxos9yoBAdd6tWK9p/i9yNWxk+tBCSrk?=
 =?us-ascii?Q?bz2UQ8EunvduI5m35bkiU54ZB/t97938P+nPNbjdKeWoOr0y68Ezdo//N4iA?=
 =?us-ascii?Q?pMwXjNzb9cndvC/yX/azVnq5RTBVWlg4UgUG82iZ7NYJSqyQugt5TJefotXf?=
 =?us-ascii?Q?N0TUe98lGSJ0Kzqat9gLSr1XBhpjq9ijT98uHnwHjW1VaBlCkSG2uqs+JmYb?=
 =?us-ascii?Q?ZBiD1J1HotDUvcVJDhTocWt+kgcNXf4r9iP5Q/t5BR5b64mJg4ejqvjX3zUh?=
 =?us-ascii?Q?RUJPLIU47gf1E6ydVgUshLULNLh72C5vjySQ/3FEHBVRaSu+rUVghS55L1g5?=
 =?us-ascii?Q?qfy9Ut9lTDXKYpGKxjwEo6ShyjjXMpr/23/YUpFJ5yUd31l6NSp51cY5VMqy?=
 =?us-ascii?Q?8oIy8e36g/ltAj9o43J4lpDujF5Y8ylzHFm0IAJbBapbArzVokcGMn6Mm1Td?=
 =?us-ascii?Q?iUR15By0LE19SvTeZifcSg5BJDb7gBrYn1SHOkyZanQOayXLD0dhjZ5NrRdi?=
 =?us-ascii?Q?ESwS5FJAaSngRzzlGnHSbTI6JOiJoepqxvP+BqjZeuiNUJZtTlWPSt1uvWp9?=
 =?us-ascii?Q?Tb0pLfKzymzEm3mAJ6+B+bl1968zxanFxI5CoZ59JcubmxMr2KEc/xm33hjo?=
 =?us-ascii?Q?bdmseiDSyaHUMYU9h2JWnDsqS9w3YiWdDZHFZbOOYdyZ9aK4V7Is2Va3drDc?=
 =?us-ascii?Q?z8prDg3OFToxlSin97FbYMcrcA7zRvAVSW52YAJ4KM7cMDz//vbd8Pw5SKDc?=
 =?us-ascii?Q?RCX4O8hGR19DDSxTJthlkIJ7aTBrKTNGSB48//gObXHkcoocq047XGZ0lwrh?=
 =?us-ascii?Q?LMRQ9JAKV4CnguLlJ8q4Yrq6ACVlrHudKo5CZB1gah5yGv9t0paq4kZJaNil?=
 =?us-ascii?Q?fUTobUP9UecLd4H/cVzQMWIA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 149dff86-e4c3-4173-6238-08d979a205a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 06:11:43.4734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tacho0AcTw5BcXMZEcIA+PeGOdzM+WP0AO9F/7P/UzEnaEcxmVA4VrHyTqeaYTNCwGzmLlBoLs52mWBnvU4vZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4427
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,
=20
> After my hackish RFC patch, here is a small series implementing
> (hopefully) the solution we discussed. It will make
> mmc_send_abort_tuning() also send CMD12 for SD cards which makes more
> SD
> cards work for us. Details are in the patch descriptions.
>=20
> Please let me know what you think.
>=20
> Thanks, and happy hacking!
I made note of your patch series to our SD (hw) guys, and here is what they=
 say:

"We are ok with host sending CMD12 to abort data transfer when they discove=
r failure with response / incoming data.=20
In both SD/eMMC spec, stop transmission command is allowed during data tran=
sfer phase ('data' state).
Sometimes, the CMD12 would have been received by card while in 'tran' state=
. As long host is able to handle the 'illegal command' error indication for=
 this situation, we don't see any other problem.=20

Per SD Spec, CMD12 is allowed in 'tran' state only for SDUC card. In non SD=
UC cards, CMD12 received while in 'tran' state will be treated as illegal c=
ommand.

However we could not understand how aborting the data transfer is helping h=
ost to complete the tuning scheme and have successful read / write operatio=
ns."

They also think that :
" we believe this hack was added to avoid the data transfer after response =
crc error...
Receiving CRC error with the tuning pattern would be normal as long as the =
tuning was not complete."

My 5 cents are, maybe you should try retries > 0 in sd_send_abort_tuning,
If indeed it's a crc while tuning is not complete.

Thanks,
Avri=20

>=20
>=20
> Wolfram Sang (3):
>   mmc: core: add helper to send STOP
>   mmc: core: also abort tuning with CMD12 for SD
>   mmc: core: remove obsolete parameter from mmc_send_abort_tuning
>=20
>  drivers/mmc/core/block.c             | 14 +-------------
>  drivers/mmc/core/core.h              |  1 +
>  drivers/mmc/core/mmc.c               |  6 ++++++
>  drivers/mmc/core/mmc_ops.c           | 23 ++++-------------------
>  drivers/mmc/core/mmc_ops.h           | 14 ++++++++++++++
>  drivers/mmc/core/sd.c                |  6 ++++++
>  drivers/mmc/host/renesas_sdhi_core.c |  2 +-
>  drivers/mmc/host/sdhci.c             |  2 +-
>  include/linux/mmc/host.h             |  2 +-
>  9 files changed, 35 insertions(+), 35 deletions(-)
>=20
> --
> 2.30.2

