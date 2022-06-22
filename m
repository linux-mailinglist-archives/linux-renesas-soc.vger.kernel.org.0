Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06470554493
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 10:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350187AbiFVIL2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 04:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240710AbiFVIL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 04:11:27 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E407137AB0;
        Wed, 22 Jun 2022 01:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRY1EpKIKgz/pCGnxp7Vl166YC9kYYvYE4sWXojZzhhAwW0R4bKjK+yZZZwdNpDsvCnegD73d1iVWv0uyy4yLpcr81uEmVpHB895P1mqH26yRZqtFHPN3NjJwFSG9vKowqHAXu9hdgV688pgiXmqXtBDfgg7HIc25zIt/Zcjo/t2kro+PkOnWn4APTkdBHIdKS2iw0gQzhDlxVJUcPrMTRZk34fwx4GTEKvxTOT3n77y84aLf+5fMxSVqVkAmbmEwuG3titHHKJFZLoY2td5A9oeBLXSwLHsmHVLOq18H6DlPdH8Cs31EPLa+C7mKGwieBm+dNO64ASLf7Ov2cUAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Pz+g+yh0lPDvkReza3FPnSg8A5cc986PJnOdMJ7e7U=;
 b=eHOetXeDlcrs5FmHN2JmMkhhY9GLi7vNV/W7LMMLXRXL6sJM2dcy1B08JtY0Vrn4xmWlct8kvyQxSAN4+k5froKEKx9fNuW8J51MIvsoNFvZk0M3ptFaILy491JBGhhcaGUkuQA+kDj9xEAioHxXbC4/yx349z0moAaNo7g8cE7CSKI/x+5+sbc84NKGjA4kH9L0/vZTV0IXCWC0+yokYa766e6pjp8y0qtdJqm1cLILo8jSCmKljl+76+AEJpwBKGy5t6my+w/xmfVr4HKOO8ivWw6YHzRPsOH+UdIdc8oIIfx14IaOTTrolgZNGPmis5i6NJyllyBKei63OQVX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Pz+g+yh0lPDvkReza3FPnSg8A5cc986PJnOdMJ7e7U=;
 b=p7zVR+ObjWtAv27tJsPBPK3jnUrEwkQcMsYkkLcvy1igpsHqdUs+UIFoNzK6mMS6UxidfVeOdIOoabuXZ6/z19kllHGIM046AfRbz7I5PhMjSgCbZg+CcK7D54nmwQiJj/J5D0uf5dRSGaSoAWFHNG5nnCmsARk1ernji/7KSPI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB2963.jpnprd01.prod.outlook.com
 (2603:1096:604:4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 08:11:23 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:11:23 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
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
Thread-Index: AQHYdznckS35sw456UqSktO9CRPXkq1aFKAAgAEaEwA=
Date:   Wed, 22 Jun 2022 08:11:23 +0000
Message-ID: <TYBPR01MB53410E99F2A9D783FAFD42DBD8B29@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
In-Reply-To: <YrHgOptQ56woMAeO@shikoro>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8174b072-34ca-4d6d-4ddd-08da5426cbca
x-ms-traffictypediagnostic: OSAPR01MB2963:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2963F288A765F2DEDF75971FD8B29@OSAPR01MB2963.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPMJpKuWHaFVdgpW6pI7VPtyo8P29YRS7YJyJEUUoQryN705JTI93fq7rJlrq4x0sccdBWX0EI184OA1PLaqRc0qLbzFmq/w3mFtXtrKkZF9XIMWlD7uX/Ulbb5UADoOl9imfiuI6nHug+mXyqRZmiUmXTB+wyNuu5FdLjI6QuwnELmjNJPb4Bv2GfRVRaaazAaRWt4WkOHSy4C/pCDQY0/J1Sh82eBv3C19jZR9raUI9/3SDhs9v3TBqcTeOvpSMuduuQ4KeTi9nFClf8FkdW/r++/FIHI1bSkdYnd15E+qfBnfMmWwpeOWWfxwE6wFanqETJ9umBJe6WEFdPmCmwmqqKngiqicX7W/+ta5nkaaYWGiC6hy9+hHD6nuK5Pba7JcsYW/YCWyffmSg3GOkm2cGvFBbRFic+D4Ntn3E8h1A0mXe+mZVfiHSn6yF6oVLjrLJBHv3BKQ4AQ2a9KuKGu7zSTxRTJDpKqUKBuY4zsUX1DmnIXTaVZmNUdeMel2/EW3Rjx2KrpOoN3zmwd5bsXC20N/0U2ka8QUjP7G8y5HVUkxY/u3MhAhAQTH+PhJ2kt1i0u3RLWj634wzkXITadWTX+r5PoaaDZnt7EEWulXuTItvnI5nn/911EXSjnfsWYKxHwyF835OXU79s6Ewa0rtxnxr4amM74XR9z3iCVqQctI7mFwzYE5suQPOzWfYVOBeMzmFgmrY9fRCsY4fBO+SMq+myWpGHeTZS7WsWTv8ENxuhxFVxXR1y+yeNbZiw1c4qciSXZyxmDdA4jUfw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(7416002)(55016003)(8676002)(64756008)(33656002)(83380400001)(6916009)(5660300002)(9686003)(76116006)(66476007)(66946007)(66446008)(4326008)(186003)(41300700001)(54906003)(316002)(38100700002)(66556008)(38070700005)(71200400001)(52536014)(86362001)(2906002)(122000001)(478600001)(7696005)(6506007)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RV4GjZ4lZVrp0TkVaAmXT65jC8kAq+1LMuyGq7a8/DnBBfkeJgm8IbcuBKqa?=
 =?us-ascii?Q?v8UhSbu/4xSBTzS66uT7iQNiuSYm60VptTNw/dvBb/OfKMtCoOaD/4wXgKB8?=
 =?us-ascii?Q?xcetUhjrrbbn25NdrlJcLQf4XHNVLsJSoQNcF5tzngcnCOrzS4/mmL7HH/sS?=
 =?us-ascii?Q?9mTHk1xa/rAvfGLeRcA4t29+mxF01/l6rZj3AvKhfBKfOTY5H63ema6Zd+Sv?=
 =?us-ascii?Q?1yyqbOe3w1pxbgXCYvfEdrm8jb231o2TDam8je2vI/HKqis9gWs0ajdAJ8KF?=
 =?us-ascii?Q?yoLHL38uo0jixPtEkjqV2iLhcYt7PqojdKqh0YoCKHgz2hbaYtKW9bWtT/f+?=
 =?us-ascii?Q?BciP8fYLQth77+22Zrun/tCUFWDF0Vjjq2rgPpxAw041Ubmq+Qf/pV9FLmET?=
 =?us-ascii?Q?7wnUqRzwTMlVXgI27urGYOImM0iUGbnNQvkWGNRprvYF9cPCXziRGxcGnLND?=
 =?us-ascii?Q?ZlWR0dsW1Ed2vy+dbGXVgggnxiVQaERDs9UnUaNFOakLzsLyUs+mouAWoRdq?=
 =?us-ascii?Q?0E5E1s/1MCpTjehOrgvRo2TeBauBj/KfAC6i1kbspwTDQePUBmhsNXDE+IA+?=
 =?us-ascii?Q?TP0/x3NdHDa4O96tvNe7CRnQ/YZhWcXnlk2YPnl1slpUCtgbpreUZE7yCBvl?=
 =?us-ascii?Q?Wk/Ie2DbnWrC86z7y0+ckZXwWq8MyedeRyk0x/YdMu1qRDaZ6DjXL5vS1eZq?=
 =?us-ascii?Q?Gx9vIEhydccUINdTTadOb+vIcFxEv9YGB7+b1fUgMl2ajqp4du86zxLre613?=
 =?us-ascii?Q?zWgKqz/BY0f87mHFYEbqh5juLAlzmMzSjQTLI8nfG3s6FTnLIImNyLzE1TpV?=
 =?us-ascii?Q?Tbe6yV4LYuQiIn6odqEBm6fFBYQIxL4z/NyeREUab0Q+UIsE7LXZ0DKG9ShS?=
 =?us-ascii?Q?4zSTeLY0tio/h3tCPAJTQC3t5GnlihShPe3Wrw07017dPPVw0CnDnL5cCaDv?=
 =?us-ascii?Q?1LXiSB/QPdatqq4ddffnfvKLiXwZ1Q5CaF0VP6mCNvDAnLRtwI0cZAotGuXu?=
 =?us-ascii?Q?sBdXvSd/FlwTSgZyhluPvjrdgmqHK+tI7Ao/BJNvahU/hBMYF4BxsqS28U9X?=
 =?us-ascii?Q?krqY2cM1vTZuuj6b+naNadzC2WREjZUuy9tcNU5dsD4uP/x/KfpqXD82yNoh?=
 =?us-ascii?Q?40tzOw8WPdI4X0ExGUT+MFOLe2jddFvc05LiisC38FmylBy/9tcw3dUKBcgT?=
 =?us-ascii?Q?MdLofe6q1FPQ/RsFyt2lALMRRQ/iB235btezija5e2CmXXPKsB34p2fjudVM?=
 =?us-ascii?Q?erWCI2j0vYkW+u3JVBd2Q/cbAEXpLnlBAYGZEK4gTqXPC9fYXFpZJ0NRo0T6?=
 =?us-ascii?Q?0PMBgg8gLIQ3hNR0fZzGJhtJyexR4Zpf/AMiHBuB/LhvtGn080Si1vPKbKiR?=
 =?us-ascii?Q?EBURTCCDTsb6Pl62SpB3yVTF0dr/7lDM3QTS4baExL7PoxZuk5YL9H8QE6/b?=
 =?us-ascii?Q?Ze2gU/1glGPbaGkCdGZu/Q9oVrWuX+RUV9rRoeeS5E+lKZjEdP+5LrTNxPVx?=
 =?us-ascii?Q?elWc5FlaEnCc2KEphP1NxoLIyjKTvSw5E4BTSrrt423ikMgZLAB7XL+77R1y?=
 =?us-ascii?Q?u0EmntkSoLcdCjxR/xmiYUnwpTvwKEhh97BtKBGAtD+ekjPuSICbRqUVu6OH?=
 =?us-ascii?Q?2u1YGNHM7uSTynhYgMKPonyeKYIe3KBhmkq2Zi1AaWIKGrvcXVWLw6eXSGxz?=
 =?us-ascii?Q?jpRTSISzA/OPyQi9K0hJC9V5xW+ybZmtQgp086Tp6mh6p+Wh1PBcC3AdUy/z?=
 =?us-ascii?Q?UY/kTHP42rUuEggvkr6H/pZBsP48WqtT9AAtDkMemsJasuoJclGUCpoS5yBp?=
x-ms-exchange-antispam-messagedata-1: eVjPehK5oyjor4bHc9vqi34H59WYhmaewy4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8174b072-34ca-4d6d-4ddd-08da5426cbca
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 08:11:23.0401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r853UdNszEjVQq5uID45lR3RwsihBg98RWryPCR1oX0gTf16dwQf4OLaLM/sftP9nA1OFnGLCV2BovYdt9AB6jOx5Jmb3MEFvrins4nq60xO/u/yrWm+Ul13B5rt0b8I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2963
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 22, 2022 12:14 AM
>=20
> Hi Shimoda-san, Geert,
>=20
> On Fri, Jun 03, 2022 at 08:05:24PM +0900, Yoshihiro Shimoda wrote:
> > Enable UFS device for R-Car S4-8 Spider CPU board.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> With my firmware, the manual setup of the clock in the bootloader is
> still needed. So, yes, I agree we should wait with this patch until we
> have a better way to deal with the clock.
>=20
> Other than that, the patches give me SCSI disks I can work with
> (partition, read, write). There are a few initial errors, though:
>=20
> [    0.449917] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x0=
3 for idn 1 failed, index 0, err =3D 253
> [    0.452035] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x0=
3 for idn 1 failed, index 0, err =3D 253
> [    0.453859] ufshcd-renesas e6860000.ufs: ufshcd_query_attr: opcode 0x0=
3 for idn 1 failed, index 0, err =3D 253
> [    0.453874] ufshcd-renesas e6860000.ufs: ufshcd_query_attr_retry: quer=
y attribute, idn 1, failed with error 253 after
> 3 retires

Hmm, my environment [1] could not reproduce this error messages.=20

[1]
based on renesas-drivers-2022-05-24-v5.18 which I made the patches.
Perhaps, should I test on the latest kernel?
Which kernel version did you test?

> (A patch for the typo in the last line has already been sent)

Thank you for sending a patch!

> But after that, everything looks fine on first testing. So, for the
> patches:
>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for testing!

Best regards,
Yoshihiro Shimoda

> Happy hacking!

