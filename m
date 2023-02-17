Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832A569AE16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjBQOak (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjBQOai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:30:38 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED7D5E58E;
        Fri, 17 Feb 2023 06:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWy/OixqiB3GCpTL7PzaT9CSG3z5E2bM4aYsZDlqMP+TLPHppg2AwmqmdJx/MBMKy7Grtvxvj0RQLPhtfFQuK2c42zBzsfZ7pmHh4lVa9VGDG7g0UeDtghY/8T2vCptqXDTdh9Zlh79E0Nl4UknM+S5YiJc3u1j/pcko518IisLUy0mYxgIEgoMRR6vqgRfzgm7ZvUM6L+vUuE2wuLZrNdJrlT0KdjaSgdWBlZQMA7r1iOl5LKj2U37INkCEL2kY9E91CdQ76kWc7YqGM/S39fpvuuCsMRFQCLU5sz1MEalXuB0/9M8zcgNd1TGZuu+vAzF+HaGlrbPxXrLZrLnZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XB13hWwmhQR8AmULba0xtMJ0OGlTVz/+4//xBkoOFZI=;
 b=CQhhhjltVzUSbbZTqRRv+99Nre726bZY16vYJ4B7XMqKJVxJ9QPsIEkFZw/Buu8IZBi7LCjjhMAvdfR2NfA1q5eTYzkTuk2YelGC4UPh+Dt+FfOhg4qH8E7j34oA3SIpBimAAdtblTo6u1zuimQk91DbWlud5KnFw1utaLHwYEMSC6AJubqLkS9/xKRWSPGZVhwKDAer2K85mTByGe/426AlDhT23m4tDSPqYc+gcWYBaU4atxHqONulXHfHQ8lz3cqUZVho+7voe3P3hGZlpVX5qkN2wvpGjKK69t7KanW2oREdQzk1iheoq2xBTlRJITKKJi/cy9NZQL14Mqym3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XB13hWwmhQR8AmULba0xtMJ0OGlTVz/+4//xBkoOFZI=;
 b=QlMz0+hXPkgOSzCu2dDxSFkVACCIBJENo5mr7xrY+v79bn+YuSLYQhS2zUj+fcSbTAQCLozIR8SVE854UsTLiR/HeuFHiW6VGTKAi07/v+eDRrqHmJ0tqHSKpjD1Vo+JzHZp9qvNT/09EH9jlJxr3MR9R/vp2MwKPnvtTKHE5nA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5928.jpnprd01.prod.outlook.com (2603:1096:604:c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 14:30:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 14:30:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Thread-Topic: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Thread-Index: AQHZQsUCwaArevUN/0mS3MAGiYZqTK7TLC4AgAADjRA=
Date:   Fri, 17 Feb 2023 14:30:34 +0000
Message-ID: <OS0PR01MB59223E65450F4EBE7F94E0E986A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-3-biju.das.jz@bp.renesas.com>
 <Y++JnBc0NaGZI5YP@smile.fi.intel.com>
In-Reply-To: <Y++JnBc0NaGZI5YP@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5928:EE_
x-ms-office365-filtering-correlation-id: e85f5aa2-c940-452f-70b4-08db10f387b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ajZDwxUg5274j3JapO/AVIk5cwI9wAdAlOLYryDcNZ9wyEI+jUYrYYLALtgCBZLTu2OKctD1AI0cVwyvQYEoEEbvFzJ4iCyV2KKw307LaMRxtvlFSKaxIKFo7lO09BNnX8auC7w2sg4fLRBMSqSO5yvh99EnR2N+D1zXbEAtDZHw1xN+2b674Zd7V11OTOVU+MCOz+XezXhkZ0sNCPHxEnQnaiCJIo+kCxeSLq9craRJVMIxhADmeRFH2eIx46NIpf7mEXLxov17Ftger90gZ0tuVcZiYJxBaHT73LlFg5AQo2ukyetw4pyN4R/+ML4NfMKOMUPMWaWtyQI1Zrn6z/I0ZjubKY7gQ5fgHXaCFONk9c59nd/9R8mUa7iqHhnHtvMqYG2ANSxc5EAEOF4uIJG77SZZ/4x2YU6l4zh0m6RNK2zSs+6mknjn7Ki7XTC+fftW5t0YH5ko/YU0KelcJCnD0u1DL+3PSc/UgZ6PWxMgHPiwoAzkMurgZ/Evx+3kBkCFy13otXLyts4tad1k8BmmDNl5lgBtS77xqQ8PTMuwl610XQBX6YFkzKHiDu2p2R5tbgn9FC5QtrrjmcRKozmRDw4K0rujHC7KwU+yv/2sR948XtWRf2jg3/OQzh6j1GrK9Cbt2Q6BHknGNQ3NDkC5kUF4X06VKPeH0bT6OuROOwUnBnNs00k4v3pFfdJ/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(33656002)(122000001)(38100700002)(6506007)(9686003)(186003)(26005)(4326008)(6916009)(86362001)(66556008)(41300700001)(66946007)(8676002)(66476007)(76116006)(66446008)(64756008)(4744005)(2906002)(52536014)(8936002)(5660300002)(966005)(38070700005)(478600001)(55016003)(316002)(54906003)(7696005)(71200400001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wKNB60HmtwG00rpt4x62yEXrp23z5bYrvw/mLJxtiNN8F+abv38fyHg4XV?=
 =?iso-8859-1?Q?j3pVaM7m23LJuWAS/GYV7ww4bbf+MpO4dDnJZuDcX1psQbFT6L3xqW7zrg?=
 =?iso-8859-1?Q?mhl8Fs8OuRCzLXLFJw4WR3+0K0xwpgkiODM2ytB+PiRiFBi7zfgrCWFArt?=
 =?iso-8859-1?Q?XmD4+ggpPXhbQtGNAnf9fmfPBq50txykeeOveEkU93BMUSDgZm2HuV/JbI?=
 =?iso-8859-1?Q?ONRR9VGDlb/CbB/RZ/t6DLoBovDrmF0sArvkGuUi1l8JGthDNg+WgX3GSC?=
 =?iso-8859-1?Q?CtXUlP8/yLNcQxxm4egHGHAfYb4EFT33xWTLQB783wtUcLfPVwxjyPdq1b?=
 =?iso-8859-1?Q?8KxV4dQSPoptp/QjZW/9bC6wq3cfC+F2so2sttuiM7Dmr72XFvSGw8J670?=
 =?iso-8859-1?Q?2mf0iPhUEOR/Add0FVyf5lieAK/+2/Utzm4uL2/WYfFspp+0cODk5Zioff?=
 =?iso-8859-1?Q?+EHra3KeITitR7PoJgOgqU3u4AglEFXiAJuhf6J0SZLIfOiFo7pbvHpISo?=
 =?iso-8859-1?Q?5UjpYezr+CbFCtd8+HS2CGtvqHSVuYdKU7UHZfh0/iRKoshgnnq6nPriBv?=
 =?iso-8859-1?Q?Wrt3P/4svHZtITWhjVWStf4NLEwB7cnei/J06FTlMMbEo2Jc/LcAYGOHSr?=
 =?iso-8859-1?Q?dJNFw7DxrTMlEp4uefeLxmgk3J0OeeR2DPviMVCzspBM3QO465M7YmNRV1?=
 =?iso-8859-1?Q?rm2a3jRidSjhwCuNnIVR1YhYlDGEAfWBE2HXSKSQwO/aVXvLkpfka+MXo3?=
 =?iso-8859-1?Q?mNVvEwtfyBSoyZ9fOHLynP+L4O9PGPy/czvOztCZVmWeJgUv0vaYKznSUJ?=
 =?iso-8859-1?Q?Hikl5l9d99Ij2twZdHplBuPGZOyyPN8uTb/aSDWv4nVMtAUt2+spUF33kg?=
 =?iso-8859-1?Q?i58n/XOypoYRpPl/TeH4/lS0snYScQUErsYb3TsSnauIEeCUqNgBypP6Nm?=
 =?iso-8859-1?Q?Dp96Wh+/h7kr4TJF8A/WRoQHTyybmhIlTP31HgdH+CMJKTjmEFG14Oz0Lz?=
 =?iso-8859-1?Q?kCMEubhLpDPik0wDgyUyn7dN4xbla1qBzUOqDffCl8eCth+x2qbjwFOCvV?=
 =?iso-8859-1?Q?gtDwTYxR7LXu5a6OTKYoizOssAKo/HONNjrRBBInUhAjNuK6/r52sxbUxf?=
 =?iso-8859-1?Q?DGyB2MTcMJENrieU84TvYN7E98sbN+AzjFP+dz4Otwpa21ceavkRjsc32D?=
 =?iso-8859-1?Q?NOhdcfxUQSw5EXhrPLreavUMhfoD2BaERQ7nczkw6Kxv04uztG4UPCbrzb?=
 =?iso-8859-1?Q?plZetan3d4q5gqgwtvsHBfomFCmBhE+RBpk+UZWTKRfh4ZzbUR8ekfw30i?=
 =?iso-8859-1?Q?FzIAqS4FKB+Xwtowf9ERWP15EBe/2pSS3E5eOXQPMtdq63NG5PYHcScNKL?=
 =?iso-8859-1?Q?stEPYQ8Dxt458SGf5NGr5koGxQ3xq3wtOW8HQN+PW5/mfV3KluCK3N9df5?=
 =?iso-8859-1?Q?V7jwbTVDn9GmreOAHCEX5DsDiQmgh8oabp36OoNw80mvJmBxRva8Yyy4AX?=
 =?iso-8859-1?Q?K/wPZwBwYF5F4bzBoJVPinWot9tsVS4ptLSogBdYq4hdqs7Qg3q35uqG5c?=
 =?iso-8859-1?Q?xAlesy3SCjH853+lg6/s629WZqjC0SGekSiZEFYw8/JRLiiKZ05rQWczPj?=
 =?iso-8859-1?Q?fBrBwPacn+w0yY1kSbCYLzIMsVkRsEH7OqG7+540O6Trd+gNdBTb69Pg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85f5aa2-c940-452f-70b4-08db10f387b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 14:30:34.2304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MqHTqudDru9P3dV0Hym+jR30KMGS3m1zFBiokMNjYaFVOCiYZzFJSnqAA48Ku3o77+cTCGn6LduBtgb3kIDTNDghnIQhvI0579hssN2u+QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5928
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

> Subject: Re: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
>=20
> On Fri, Feb 17, 2023 at 11:42:51AM +0000, Biju Das wrote:
> > This patch removes the unused header file slab.h.
>=20
> Please, read Submitting Patches on how to make your commit messages bette=
r.
>=20

Thanks for the link.

I rechecked slab.h [1] and 8250_em driver is not using
any of api's or macros provided by that header file.

Please correct me if that is not the case.

serial: 8250_em:Drop unused header file

Drop unused header file slab.h from the driver.

Is it ok?

[1]
https://elixir.bootlin.com/linux/latest/source/include/linux/slab.h

Cheers,
Biju
