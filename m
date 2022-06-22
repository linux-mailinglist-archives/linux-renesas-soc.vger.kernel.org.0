Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C975548AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 14:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351878AbiFVJmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 05:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350562AbiFVJmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 05:42:22 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA30839B8C;
        Wed, 22 Jun 2022 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655890941; x=1687426941;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zp+fG+DPmbGqQHor1Pwud2oRWlXTyOXeS/rzDAdGD8M=;
  b=WGC3NKT0bSBe6P4pA1uuwMwht/WTlqFR5c7/zlozZisykbWsBXRaC7Se
   HYYsFqn1wO/r1Sb+dq+wy3GA06AWFrw9IawII1qFpTRnhKVHxSkZvPoU2
   MsJFxjJIYRX6tQ0skP4nWr60yCNTQJmz2ofjQhvey4BCmzXbk44cWFEAp
   gvkC9mqtgymwvA2VXdx+tn6M5/1o6Iwb1/pTKYQR/ceVX7HkEnQxhQL4e
   QOt6q68/pNSW6Ld78LIBTGIgDLiSzVDCUM0ncJOqgI8dT83i2wjmAlu8A
   RBlpXL5Ot2Ewr0nm+SUP+EOMnVWLKbEOm+tLoKxmOwWVz/hFSRYFnrs1X
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650902400"; 
   d="scan'208";a="204561945"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2022 17:42:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwBKQZXliFNIqMnCLnA0LVhtXJiPaRF393mdAs/dCiDh1YAYK2okLy2f10fq68RPsumCSpcbludenTtIvc5cFqye8x/Bl5rY7GsGwZAyMGTVRbRKMagYvG7K/w2u4DDDRy920aJyP1XcuXoiGi/zvsKE5ANi2xv+4zygoiGfkK6xF0GbYukYHBF5FHYiL40ZaiMoaXN0H6cXZ47V78H4O2EZB2QJ7ogPQBBWj32vV2zM3gLiT2Rw7Wpj+fzzEgjSTKabQEC6XGbYYYHfBzQpH+M5dB2IF5VgQ174nbBb0PnODBzQE+K9hP8MVBKGKee+ofsQhDKS2+ZwT/ctD/I6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVoi0fxu+U8QshuJsHxJd4ibjOMCcr/NsICwNSBkFMk=;
 b=G7qB9pEMIAz467iklgYyWiSar5nHCkbjdcthbtHDETOhi0B7sIVUOicBQ3y+g1Xhcd2ee6/fOxp8LuQnrAShpvk0r7GNVrLbb6aoFLx7sKfnYy+Jjiar55Z3fLZ2ajpsPkPHSqoj7P2fa3iYNEjk2zJDa4II2pPtefnnoe2kC9exQf50TazrtMUssS+uRfeHCddPMcPp79TwXKn+XbXMCJ01rBjFHYFZNDs7bFKeSiDX+VnsQ7CV9NyIiwnNifnl8bl6qOSvx3LEryNLN7E6fZAL5SPuJsRcPueJY3MzE1jaaXWXNK2uMWft3HrHjE3cSLamPd9qWrIPG0edGYeAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVoi0fxu+U8QshuJsHxJd4ibjOMCcr/NsICwNSBkFMk=;
 b=SPsQCUB4K9H9ouHB8KQTaTS64icwO7ANcQAilUKMDhSadOvsmHungVfrbUFPyG5CZwld+GWkRSaGNb5Z0whfv9lLIGCOv6uEX5VDkWGgmIjiJOh2hFsFYVA0YpBDCG5AIMee9ynN9kp2keIgF31skuHO/fSJxz2a7GVQ3qXSTg0=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 CY1PR04MB2188.namprd04.prod.outlook.com (2603:10b6:600:1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.20; Wed, 22 Jun 2022 09:42:16 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::5d26:82d8:6c89:9e31%7]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 09:42:16 +0000
From:   Avri Altman <Avri.Altman@wdc.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Topic: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Index: AQHYhYGQfGepPuvwykC+XkcnFWdRYa1a+ApggAAjuICAABEcIA==
Date:   Wed, 22 Jun 2022 09:42:16 +0000
Message-ID: <DM6PR04MB6575FD5AEE828A184B3713D8FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
 <DM6PR04MB6575D7C91E0925B5D498ABF3FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <YrLU6/jAZ5lGnL3p@shikoro>
In-Reply-To: <YrLU6/jAZ5lGnL3p@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a67c1e2-49bd-47b5-959b-08da54337e30
x-ms-traffictypediagnostic: CY1PR04MB2188:EE_
x-microsoft-antispam-prvs: <CY1PR04MB218803235F87D87785B95062FCB29@CY1PR04MB2188.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xgoYlfoclbPHVVsuw0AJmzd7mJLYugJ0+cqX2ateDzwVthM3ZzUOsWTC8P9vQsSNRqtXMqeQQOFcVcMvTpOhGEQBVxC5C3um4ZTj5VwKdF/lBrzBhRv0QEhWWdPywUfx3M7ABgoxI/88wy/YJzAUgynlStKkWuY3SxYJzeo/07jLo7M8Ukb84QfopnI7pIftU/lyk5GUW6bA6MC5XJBQyioGuvM3GHlyfsVRULs0QjiF1vG5bVsQd9J+r26B8yFEszhPHSzlNz8ArraUO/4yNiDfg+NM0j2qbbe64r6bXmcSeLBR//JouneusBR7HLmTfxQ412L/BbzLTdUOSupLU1DzYBVbI24MgJwBFIj8VW/YPswQstgF+pwUIlzQZqG40JSaUVd+BAmk2qJcliERCDC/pkT1iJ8s0TXIEKtwtzvn440dxiYFWT0aihnL77PQnv/jDAsA0H56Uh3cXDiTk4Pjk4HhiZIGN7VoAT/S80k4tSQ3QTGKFZJ4RFJqefMvJgM+fRztnEHEpiRPiPJMP3cgslKo2/ZX27e45gZj160SURqWYoX+3M9VTfgD3/gM/j1sBAkhPM0s2hhMvevKjgqztdDO6GiRce0QHPKlpUBKogudoF5/SkVPuZAALhq2IXsw7DLoHDpDt8eeZe9x9q6c/Y/L/YW2weE9nLvgLAw4/TeZD1rBhKP1qEMIXa3nbfNtsIeLIoepWxGyzYEIsu5OXD6F1pMaLk7a6qcOc/1P5+SgHKXeWVg/rTOS7s6Sx/URg5smhG7c3QTYsOV25g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(66476007)(76116006)(66946007)(66446008)(64756008)(6916009)(54906003)(7416002)(66556008)(7696005)(5660300002)(38070700005)(316002)(41300700001)(71200400001)(8676002)(6506007)(4326008)(478600001)(122000001)(8936002)(52536014)(186003)(82960400001)(55016003)(38100700002)(26005)(2906002)(9686003)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OGEoFkQlPZ3fvHIKBlfaWWGyzgJzXhO/awsmK7a7SX6CAVsPdQaL3zHyqpgJ?=
 =?us-ascii?Q?ru++wW93i+OcqDe1iXcXQ9mUa5ns1XQlgtBxnzzJDW8YEPe+oI5vxazqXr+T?=
 =?us-ascii?Q?nZM6M/Pc7UeWw8fTSAUPBqr/tshlRcYpRFeaeOkeMAqhAoB0cjtFDGq58/0/?=
 =?us-ascii?Q?Yf8c5uNKnMGZbFM4sYLkbMdbzLBflsTGqIq6PHBjpRFfVjxMjuEDzq2swIrl?=
 =?us-ascii?Q?OlatjhLtl4W2oc7cBIk/WPUkOepumV+llY5XJ44WQveJrj0HMPVtYlbFqpr2?=
 =?us-ascii?Q?JuoJ4xCsyWP3mNVQq6mO+HQqTOWgcEbL6ppFCXpTn4lduoPuc1bNToBBTKv2?=
 =?us-ascii?Q?vwxVb4heUC3urbmv1rSGVzdQ4TJ/OLGno/HMfMmFFaJwx+rH0wWwtOd0Hc53?=
 =?us-ascii?Q?R1Dx2TJVQCcU5G2DdENN2REEadv/7Av6SlfKw9kPc29r1dK9Q8Rvh91Y3bOx?=
 =?us-ascii?Q?x8CJTjmc2k8UUbna2CBB7+GfP+5q1jCLw1SGuVpdZW1IQMrZUiU4zjgDaCmF?=
 =?us-ascii?Q?FVtnq/BLGRlk/Tpo5vy8i9T9TbdwAX0PYt1gC95nh3ccMADxCcKYbd2m3Czn?=
 =?us-ascii?Q?ry8GyCndP6jnJHY6VmCjG3d4STsx8yM9eJnd43CZrQ369Yq1HI7pwOkWkdgT?=
 =?us-ascii?Q?BpYGNZo/ftBNp9AXhhhRtarUr3CCWEzzTAy+tNIMGySANih4/eSqhDZZXXSw?=
 =?us-ascii?Q?4vKOU4gT4ozDeE90gvVnDpWHmTT4mFcv7dUTsNyFgtK6d/o2o+4qxfyeelpS?=
 =?us-ascii?Q?A6M6c4zuGOEcwcMAGWBSTj8qvedVh2Cm5aMDuusYRbqssGg2SXlGF3KPwdX7?=
 =?us-ascii?Q?MA0Zg9PU8WmkZz1N1wAm5+HvU92iHcgI4P+OAR9pMvbqDzoIaKkXfFPyItEn?=
 =?us-ascii?Q?3Asbw0How/Z4wXb0r5m2+0UBJmx4uhZR78QipAdl2ASS8hBGM0+eTu0EXxH8?=
 =?us-ascii?Q?AVKC0UFIejiMx+N1SUp5lpWDH8U/KXN0HGUEMoYIpk53j/0VpdBchEq7lgA+?=
 =?us-ascii?Q?4px76bDTlLC/2YUMR0jcdAUnYwAEcivsHcj7+H1UzjhzsJDNfzPCdxBCkP5P?=
 =?us-ascii?Q?Nc/BgCl8w76/liKpAUdQbJuHwqmssNzJEZJNOBp5d1jj7vjHsPo13jgndiFZ?=
 =?us-ascii?Q?Dj1sTjF3KEkPTIAe6d6uFaOolLTjOuQMufIbftdMtFzZdai45CSSCaN7DXG2?=
 =?us-ascii?Q?FzrBEb4nECCvS4X86WreuWi20m7iKViqJXDifcJ+dWGJk4V2tHmMAe99GvWe?=
 =?us-ascii?Q?0iwT9lfxSEa2ogNf9I+1t6kA3fa/iEn0tL9S2fernz8bAZ/Hoy0RaqV5pUaU?=
 =?us-ascii?Q?Kp7aV0TqUPjNBxa3oV5lVo2KQFi+YnQFgmYeNxXIGo14/OojRerxkO+j3UwD?=
 =?us-ascii?Q?Jjdh9syTJbH0SDXIeU09mC/c8Z/o0k6oI+qC9Nsu+UWpDOGJsP4Lb53aJtZq?=
 =?us-ascii?Q?SjM4//KOK5Iojxxa/MZKlzcfTXmfITMoN9ZrW/u2w8Iy6LgYwWdd+w1MXacM?=
 =?us-ascii?Q?MZt+gjjbxaK2VijbZRpD26ZdgYNOdGxDTAXypG0pSMuKrDe07w7FPY4aqvaX?=
 =?us-ascii?Q?qdyuj2hqRB/D191Pn8W/IWX3LE9v0IiWo7R3h4nRgaVqoFMXhIJTFZncS0cb?=
 =?us-ascii?Q?uPhNXrEie2GVjTjeRQc7hCmA6HhchTb9HxaxDWTq6bY+UvEaQSoOrMWo7zdj?=
 =?us-ascii?Q?1rR8y/AkASR27Nw0mo4h/IK+HHI51jXC0P9nwoyabyr4HBeYGzD1ch0x3dIQ?=
 =?us-ascii?Q?QUB6tLxtYw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a67c1e2-49bd-47b5-959b-08da54337e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 09:42:16.3212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJKC+EOfLUxCJQ8QmNaMwaTPGomjg4Ux/ik82mk5kT0E0xdAcjSMa2OBmQk6SxUPw47Yw8ZKWqHUthQ54SpJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2188
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Hi Avri, all,
>=20
> > > [    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode
> 0x03
> > > for idn 1 failed, index 0, err =3D 253
> > > [    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode
> 0x03
> > > for idn 1 failed, index 0, err =3D 253
> > > [    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode
> 0x03
> > > for idn 1 failed, index 0, err =3D 253
> > > [    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_retry:
> query
> > > attribute, idn 1, failed with error 253 after 3 retires
> > Should be interesting to find out who is trying to read an undefined
> (reserved) attribute in your system.
>=20
> So, the call trace is:
>=20
> [    0.455361] Call trace:
> [    0.455521]  ufshcd_query_attr_retry+0x68/0xb0
> [    0.455808]  ufshpb_get_dev_info+0x80/0x110
> [    0.456083]  ufshcd_probe_hba+0xce0/0x10d0
> [    0.456349]  ufshcd_async_scan+0x34/0x310
> [    0.456609]  async_run_entry_fn+0x34/0x130
> [    0.456873]  process_one_work+0x1e4/0x434
> [    0.457136]  worker_thread+0x174/0x4dc
> [    0.457379]  kthread+0xdc/0xe0
> [    0.457580]  ret_from_fork+0x10/0x20
>=20
> which leads me to this call in ufshpb_get_dev_info():
>=20
> 2622         ret =3D ufshcd_query_attr_retry(hba,
> UPIU_QUERY_OPCODE_READ_ATTR,
> 2623                 QUERY_ATTR_IDN_MAX_HPB_SINGLE_CMD, 0, 0,
> &max_single_cmd);
>=20
> And from here on, I miss the UFS experience to debug further. But I will
> happily provide more information if people give me pointers.
Ah ok.
That's cool - HPB is enable on your platform.
For some reason JEDEC didn't merge the HPB amendment into UFS4.0 - and I fo=
rgot all about that attribute.

Thanks,
Avri

>=20
> All the best,
>=20
>    Wolfram
