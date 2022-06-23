Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A412C55721D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jun 2022 06:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbiFWErQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jun 2022 00:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345813AbiFWEUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jun 2022 00:20:24 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFBC2D1E9;
        Wed, 22 Jun 2022 21:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bp8bpn78W0Xt0KvwEZ2XN9w3xMtTx+gA8r04T1woj6amw8s/zlR+FqUeOfEKJbnb3vlF57bK1mkgXFo+XCPRsbY2NHHdo21kYsUjPRYEAO8fb9RpcXwUB07/FwbKXNxSN5QF8OdiNkakBhR3WXJ0R6PpqRiDJZOggkvjV7fQg/pwo8wW23agNa//0VbFIH2/oPYsOc8vL28RGbPYG4JzHpzcTe6jwLt4plYFxyH0l28WbudcAgFhKe8d9d5sWMb980L64jbMTgrm1Is2fFFXsPEh4bZhInb7rC8c1I3zJYIyd2DrE+4dUsuj8TqQhfIdsdKbliK6qX5olvkhZkjnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSkjrYAx9eE0r5MwC/RvR9F/EPZ2lLZ+MHvCOh15sgU=;
 b=k+VF3F83/ilrxyotbHsa8cu/TMqewVNwD/T2niiLOgYCXYv+9xnsJdBiiBkYBz+geLgA/I7vfHTxJdCvEXEdCdw6EFllh1iX03ROoTPCmV+pfVnB7oIoWj1SXFuYxJhQCQNv7Yo9lppZPlOcFEJ4sEmjP4CJB1o0xrqpu4Dp/H9AbBMAj9WoFx5FREw2tyWQnIv5i6z67d/mmWPufgYKhcqhnyJxjXO1Ew7e/FIjUReas9FtHIbUSZJvqJTzCzawrO2BsOPQmRXXYTZtabaFy8R0yuAbCl3zWO0z9iP7mz6pvhdpDVBAivsMg4LBTML6DB0PUtehnZ1j1r+DgdoN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSkjrYAx9eE0r5MwC/RvR9F/EPZ2lLZ+MHvCOh15sgU=;
 b=c2lks1ywZCce/HueIQPCAA3tN2g27XVVBJun0bT9j5zUqdjn6/WFwr/mjV+iezhl6DNdhL5T+7ms++VHSSoyF6n1KTbJsazb1FW0RAkKDjYcdkHmKUe+IYYy+3kC/QOFjb2yLvzL+UwBrJw5RBaSsZzKnciMgXN6J+aSiCDr2cQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB6938.jpnprd01.prod.outlook.com
 (2603:1096:604:133::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 04:20:18 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 04:20:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Avri Altman <Avri.Altman@wdc.com>, Wolfram Sang <wsa@kernel.org>
CC:     "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
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
Thread-Index: AQHYdznckS35sw456UqSktO9CRPXkq1aFKAAgAEAkgCAACMggIAAEfEAgAABXgCAATKXYA==
Date:   Thu, 23 Jun 2022 04:20:18 +0000
Message-ID: <TYBPR01MB5341F4A79B63267D408C520FD8B59@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
 <DM6PR04MB6575D7C91E0925B5D498ABF3FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <YrLU6/jAZ5lGnL3p@shikoro>
 <DM6PR04MB6575FD5AEE828A184B3713D8FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
 <DM6PR04MB6575DA24CCF398A890129C78FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB6575DA24CCF398A890129C78FCB29@DM6PR04MB6575.namprd04.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71a24d91-b652-4ae2-9a40-08da54cfae78
x-ms-traffictypediagnostic: OSZPR01MB6938:EE_
x-microsoft-antispam-prvs: <OSZPR01MB6938EF1E94694E605BAF88FFD8B59@OSZPR01MB6938.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /7TrfT1UpkAAsYF5ceYUgGxkGl2ZiUcP9h890VAEZAv3XldU9C1sIu+t0CGliEby5p7nb45T5Hlp1BRj2GAmNu6JXTlh8lKha8aglu9UISVNQKPVXr8IWpdNa8h1vgKBN3XTGOXvqjwVC/rwHvLoKAn/o5ZcGKrP5YdzkYXr67dsM37SDmXZoLylsL7ll4cLj+2PuLRFiEzbw1v9FZfpeTuJCpsuifsKuj8JiOoXFKL0RWcZ6JLWOO37BNTY7Vn1JbQTRUm+cWx7FytMp9017UM8ZXGiFmo9H2S8eCaGJuJRgvvxLWIFFt60RD7fTfBjB9m6ZNLmtzg9vKI9NlKbL+YEUPX1INNdO2YRbuCkXC/d9OmbNluMd3zcZL7gRC4E2G1roR/x4rTout2u5xxobmzNhTdFAq4j22RB4fqIorJ4WRxqjhOcAss0i9kD6PqbmXG6Yy/7AzKNr8XIRBrbsbY3JW6MBdyf9X+B9zo5Tr40MkLA5dyfDqeAfNlcOTB+tfKgyEvQ0sqmqKJMvzZBS/S689DZ3Em98iGkRWMhFwQe3ebEZLycso7MYY4tPGpLLHSp+f/mj/QobtO0diK9PhbtHy00PqXD3NqGArvLjWV+XdyAtiDASaxZgdeH/2N36E6cC0wV4CXuWnsdpFH/Xzie8w7kU/iKRP3pLY4cjGGMHqyASajlWKozNRIHuipNsl5puUbs6Y03ZGeznQcP0elsW11hVdWNT924cdHHyQa2ssWEYQWRYU3wbcGipzBIZOhBMgBpe8+DsL1c7kHQDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(71200400001)(8936002)(52536014)(478600001)(55016003)(7696005)(66476007)(8676002)(66556008)(38100700002)(4326008)(64756008)(66446008)(33656002)(2906002)(76116006)(66946007)(6506007)(110136005)(86362001)(38070700005)(5660300002)(9686003)(54906003)(122000001)(83380400001)(7416002)(41300700001)(186003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bGNpjcGggEdCcB7ADca5ctsIBLa2QUhsc+6yE61FJrJzLCaudP9STG05r+hj?=
 =?us-ascii?Q?U8VahgVCUpYeGAG2+69BvuosXS6KmkoQg6FQKviFMhjmTO+jiMNCfU51MAvx?=
 =?us-ascii?Q?tPhi2AxbA0Lq8gTk/mynRpMD6FuMAP2tJvHxvG4eOgaLlSW+My5xVNs9+gc6?=
 =?us-ascii?Q?IBASJObByu1b+H8BZQDV8YIOF8hqZ/SiHDCiy4a49xsEbT9eN5U4O1tC2vaz?=
 =?us-ascii?Q?TG7YVRhrjN544XGxbjKTtB1fVRYq5vuI9MTqSWdG3LF73o8uNr8b2TAWzYoU?=
 =?us-ascii?Q?ssiAgtyslWdOw6zAqQX3yu3Eoxy631NtyghT/XBb1VK4tOJh9COX/Ivv0i/+?=
 =?us-ascii?Q?lGf6JbUzG1o11IVKJfKGAfbR3O5/OzmnO49pLzc/KizuK1xgtJknQQ5bjgA1?=
 =?us-ascii?Q?pDKzbY28PUIAobtLfe/hlm657mAxkgakrlx9wm4P1WpU4BOr7vujo0mwiZ8h?=
 =?us-ascii?Q?1u9rx+7ZR5SdaBxjMZcepUNshWW+4oEJolqliwcA3GWQO6s+ACCViq4hanVI?=
 =?us-ascii?Q?WcBA6Fof1PnGh0XyGiikvC49l/Ttf4M/SlICwtxNg2oGOWLuhv9W9dqe7QQF?=
 =?us-ascii?Q?ZHmncO6ClLOi3L5vzup+aItKgiZPC5HRaLf1cHDkzCD5cTAQ3uxu6XZDLO7u?=
 =?us-ascii?Q?Td5J5bAg75jPccPf5hAHFcY/K1ucDBq7qekaVboyV/mqyz7HjeHGPIcAzj9n?=
 =?us-ascii?Q?4B86AG01bv+G/QiPrikrgo6oGY2NTqoAx0+dZnf1ZLn9h1lfJK63jMMMbbZw?=
 =?us-ascii?Q?jd6Jj5V3mn1ZspHh/D659QONmtcDFwV9H5c/RJMuuFIWF0ZHl0UQrbT1fBNZ?=
 =?us-ascii?Q?P0pvuYehCXHM+kjTNx9yntZDn+n4HZmXZy+1dr8azxCvjddBAc1uIozpLKse?=
 =?us-ascii?Q?KqxyE6gAy1VwoXLnQawqvRPeWPxXSATY6ofmtq+HUnyByL9FfHElj7QxHQka?=
 =?us-ascii?Q?PhtpZoDMhlAYl7GJZ12qjEaiEnwo5CqSjilTmqU5JLd0X8U8/drwTIn3INuI?=
 =?us-ascii?Q?IfaWjz2mKZjVmknucrgj5QeRxsaMUW33k4a//6AdAlcJTokmBfEAqsZE1HFp?=
 =?us-ascii?Q?Fk63279siI+3ntF/AX1ITK+uYvAKyYjo7Q2z71tP0f/NRYfiOgrOnJ+JZeUT?=
 =?us-ascii?Q?bXUe0MObSuzenY7i7SD2g5dVQlsfxSRVjYkw/Dt+zyjY7r7ti9bZ4LWWB3Ir?=
 =?us-ascii?Q?3R21+wl5wuxHSsakRy1UtLCmRwYSedxON4ZRSiNhHO9D2oTx1wzCQtJN7d9q?=
 =?us-ascii?Q?6slbPtnFVSZPpz3kf53cApU8/zlWkdXOo93DrHCeiI0MZdMoTjrq0tWtw2jX?=
 =?us-ascii?Q?ca4Jj7gwdx8HoQvEKMv9Sb4P/pwLi6mbVaahJloqutxa91ASJpurg0REnfID?=
 =?us-ascii?Q?PUAbsgOluYI3h6HQyFv2YonCVGNBdFzo/IBTJZ/I52CAks07+yguBZrSUCcm?=
 =?us-ascii?Q?sjI+i3WuuYt7d6LSxNblkYO1tnKcq/cV57ipjCk+A7P3YsCZTjO6wjckToAd?=
 =?us-ascii?Q?NK9wQ3aBLkRQcTvufyJJm5+FhqoLONDFyVXJh6NaNHq5MvAmfgvJiz3k+vNk?=
 =?us-ascii?Q?v94BGn0laS14SeFLEAVH+gdTxG9bBo116+1m9l6ZuZ5xALwcBJ5xUEgbgvnY?=
 =?us-ascii?Q?rDq5E6ZhsdHSyEkWffi21+rIUh48/CyFvOgmobIXp7Rnzyz0b1CCDrwxcNLz?=
 =?us-ascii?Q?89hBP/YPOEMaV4yFswkwbuKAKVIArrq8deQSnXf/UVMrBm1dHr8+Xyz+cidh?=
 =?us-ascii?Q?JfCcChAXVlG47zzkQnhREEJHvtbNXboQHPWD7mWEOTwLuXIIDdoaS7rHWSUv?=
x-ms-exchange-antispam-messagedata-1: 0Bx3fSclb9m3F10WjaxVUh+AltjbDyPxleM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a24d91-b652-4ae2-9a40-08da54cfae78
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 04:20:18.8136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nI4datLVqjg9unRINSAAg+kcXtCyx8OBKI3/NQqTSeClKmXNrLGlo8IW9k2PlvLNivKG4EGWaxI9rkKWC1LK76d9RUYg+mUJaYM34MgT50fWTWq9M0yaVNrS38m6shG4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6938
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Avri, Wolfram-san,

> From: Avri Altman, Sent: Wednesday, June 22, 2022 6:47 PM
>=20
> > > Hi Avri, all,
> > >
> > > > > [    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: op=
code
> > > 0x03
> > > > > for idn 1 failed, index 0, err =3D 253
> > > > > [    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: op=
code
> > > 0x03
> > > > > for idn 1 failed, index 0, err =3D 253
> > > > > [    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: op=
code
> > > 0x03
> > > > > for idn 1 failed, index 0, err =3D 253
> > > > > [    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_ret=
ry:
> > > query
> > > > > attribute, idn 1, failed with error 253 after 3 retires
> > > > Should be interesting to find out who is trying to read an undefine=
d
> > > (reserved) attribute in your system.
> > >
> > > So, the call trace is:
> > >
> > > [    0.455361] Call trace:
> > > [    0.455521]  ufshcd_query_attr_retry+0x68/0xb0
> > > [    0.455808]  ufshpb_get_dev_info+0x80/0x110
> > > [    0.456083]  ufshcd_probe_hba+0xce0/0x10d0
> > > [    0.456349]  ufshcd_async_scan+0x34/0x310
> > > [    0.456609]  async_run_entry_fn+0x34/0x130
> > > [    0.456873]  process_one_work+0x1e4/0x434
> > > [    0.457136]  worker_thread+0x174/0x4dc
> > > [    0.457379]  kthread+0xdc/0xe0
> > > [    0.457580]  ret_from_fork+0x10/0x20
> > >
> > > which leads me to this call in ufshpb_get_dev_info():
> > >
> > > 2622         ret =3D ufshcd_query_attr_retry(hba,
> > > UPIU_QUERY_OPCODE_READ_ATTR,
> > > 2623                 QUERY_ATTR_IDN_MAX_HPB_SINGLE_CMD, 0, 0,
> > > &max_single_cmd);
> > >
> > > And from here on, I miss the UFS experience to debug further. But I
> > > will happily provide more information if people give me pointers.
> > Ah ok.
> > That's cool - HPB is enable on your platform.

Thank you for the information. I disabled CONFIG_SCSI_UFS_HPB on my environ=
ment.
After I enabled the config, it also output the messages.

> > For some reason JEDEC didn't merge the HPB amendment into UFS4.0 - and =
I
> > forgot all about that attribute.
> And the source of this error is that your device does not support HPB2.0,
> Which is fine, because HPB2.0 support was removed a while ago.

According to Device Descriptor information of my environment, the UFS devic=
e
itself seems to support HPB2.0.
-----
Device Descriptor [Byte offset 0x1f]: bUFSFeaturesSupport =3D 0xff  <--- so=
 device supports HPB
...
Device Descriptor [Byte offset 0x40]: wHPBVersion =3D 0x200
Device Descriptor [Byte offset 0x42]: bHPBControl =3D 0x1
-----

Anyway, the UFS driver seems to work correctly, IIUC.

Best regards,
Yoshihiro Shimoda

> Thanks,
> Avri
>=20
> >
> > Thanks,
> > Avri
> >
> > >
> > > All the best,
> > >
> > >    Wolfram
