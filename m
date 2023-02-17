Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9D669AE6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 15:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjBQOxT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 09:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjBQOxQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 09:53:16 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557B93B228;
        Fri, 17 Feb 2023 06:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2/kXAUPImi22Mmgd0UQmsx24s3LNcaqdAnP7fxtAvfjPB1wQ98rHPeKaunJKwC1/ZgIu3Rs2JcW6DvvuDqTsE+916UC+WBZIIF9VDlA9iAK32R2d/jBJkTBZPmiv9CwruXY165pc6CUa401r5AU1J5V/cZn4fODGWmsFXaseqqgCw6cqvzOxMQ/VhufplO8DM1Cds+//XU0Y/gNivFFWXo4E1bqprWFPh0n9H8kABYI/7ieuTW3OWuv3dR58VltYYcAdwZ38+8uXIBRq9oGqkiT+LKBwF7FDr30rncb5eVGehUW2wAHM6JHFjCrQLTNKYmvDy+8z99GtX8882Us+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZS0ct5SYsN8FUO9Ss9fz+ImpNh8QnDgZRSCqkCAdCmo=;
 b=WyYwGUml/8Dzb2gjHVa5Z4Ml6199i1CGWauLAbGHVjuH4iLWiFFBpsJHCoccLv6HnNZ/SPYJiuKSeLDOfYFbohEALYRwL4Jl1FWlaG5GMAPY9Zc+BquTr4mUabF9MKc9sG+NeCUe9rugnX/G9ba49IS4yEqiuPJ9uRHV6jq8L+nW/l1qdS14sxWijBV7sE4jkZe+yYVfxgLBW7GlnA2d4NLodsuvGJsrRJJpiLJiz+7z2tr7MV3TkCz+YjT13nDm0Cm9mtX72h6AdHSaTmlpJRGkzZHOqQdnjfXRnYGQUC6xaPyjdp2YSgvr1YgqM2klitPEMgn764efZCHyh8DghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZS0ct5SYsN8FUO9Ss9fz+ImpNh8QnDgZRSCqkCAdCmo=;
 b=sLgEtyaNU6JGtekSHXcLEsV4QqWMUNoGQPRCQx30ZYdLgfAHnStwAgCdzJR+sHLojRebpjZZtwYfPrsJ3yvbLjgctK6ODdxmVt6kcUOhQMcmX7amVAFqza8tTRgemVdgdlNlTP6QIjjFGL85DfTqBx5JWZipZSmAiYKE/efN3Rw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10699.jpnprd01.prod.outlook.com (2603:1096:400:297::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 14:53:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 14:53:07 +0000
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
Subject: RE: [PATCH v4 4/6] serial: 8250_em: Update port type as PORT_16750
Thread-Topic: [PATCH v4 4/6] serial: 8250_em: Update port type as PORT_16750
Thread-Index: AQHZQsUG0KW/ACyGm02w/mFIFP36lK7TLJAAgAAMvUA=
Date:   Fri, 17 Feb 2023 14:53:07 +0000
Message-ID: <OS0PR01MB5922AF561589501F7F085D5D86A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-5-biju.das.jz@bp.renesas.com>
 <Y++J7u5SY5Z5Z857@smile.fi.intel.com>
In-Reply-To: <Y++J7u5SY5Z5Z857@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10699:EE_
x-ms-office365-filtering-correlation-id: d56a5c14-ca90-41be-d6c0-08db10f6ae48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B4frww2sal6Pl4PCWBaUIwlkWF5ojQZB1Jwvzptnar5Y1BgBUA5YyIJgvQ9/KuK1Ti8NC/cDMpRDxrqCxqOEAGCFQPs8PVkkuLGokFTVsd/dPdRFsxumj42NZy61VnacSgwoz4OLbAP3MlPoHeAdGydu9Bh4aFbF6r59c1tKiB8hBg9EiitIc6ag8CqEkfeM61g2K0ePnbAyFdDojspyIEnFkbFkBfaREr6sZ/8UDpmkz0M0h5g/5U7ZcaUWmVm1r6RTH+MorM2h11IiCYLPwLV8vG5TmVqhHlxegeJMPgXz4lDKwHYe8BAjYQ0BJCZIWMfj6RsBBV4eR/kTJzVVX9IUs7/woTTF295WB9d1IA3rmOJTGG1J+REU2TnQEG4QYYi9U5zeNTfH4Y/kgRhgx3izOgOqM9HUKFkQBfd3myaK1AGiWUWqWtcLU/wHP2HtSGyXiaunDCjhzqM0NaVAq/ODy3no8V4TNe/MS5YLENlf9ARHtgEus07l+sD4BeJ4BD+EW96knjYQQfJY6XPAd0MA1VQ9kvuNFUjXQKsWiSBMqO1SLf1jTYTeeS40Qa8rxXlHVG9+EvP/4BJ9ynbHhTztQz4Vl4MyuZuYlyVXt+XvuhdbIfwkwjaZ7Nruc/aajjGh6zVSmsnvrbYHLB7sYjEkwEyyzK3ewppWsygZNyTP4hiBZTv3lQ3D2kcscK/gR8ezBtr/Hxgp0qpFbmqNrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199018)(33656002)(55016003)(6916009)(66476007)(2906002)(64756008)(8676002)(8936002)(66556008)(66946007)(52536014)(15650500001)(76116006)(66446008)(4744005)(5660300002)(38100700002)(38070700005)(4326008)(86362001)(122000001)(7696005)(6506007)(478600001)(71200400001)(54906003)(316002)(41300700001)(83380400001)(9686003)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qWsguZV9iD0L4heZFvWIa32bWmZtkw/N0Nc9gWmpMbv934w7yla/X0J7tl?=
 =?iso-8859-1?Q?GN+qLhlG9IsBMjSQwYZeGxjGXTgeKsvEZcs641gEfSlsL/lZDXs7DHqhUO?=
 =?iso-8859-1?Q?25AzaFu7DFLEER49NL9Rxpr3mjoBaVbx9xAlTi7T/2L7IOnPE+3OQNxtNf?=
 =?iso-8859-1?Q?xg+jwqushU970kWPCJJKYNExYWe+p1X9OGBBh2XKApDaNFf3EtiTMrbRWW?=
 =?iso-8859-1?Q?cJemOy/tjdvM7de0fRto3e/l721waue5/iV6KcM4DXNq5A2tfJ9NLVcuxF?=
 =?iso-8859-1?Q?fEGyuC8zLITObxr6pg/EkUyRXE3A/hK5Rq3JuKYmku75oYfXJbs2vDjSzg?=
 =?iso-8859-1?Q?jgyA2lTyTrjd8DWw8GfmF3NTRzVcYx6s+GynUYAX+ApqwlwzghCRbyB8ds?=
 =?iso-8859-1?Q?SdOK68ETEErBZj+obzE1LBFFyFsBssARVpWNLjzbsAcHq5MlHatC+K5IIr?=
 =?iso-8859-1?Q?L+ELgSjOGUIDsDx2zvY5MTdccpjI2xk/0N7h5debES1QxdSbuv6bW5y/kC?=
 =?iso-8859-1?Q?4AgIgZ+kusj92TYtFQerDriIHSfcASYHe486HVYcPSJJHYRx70Ga4hSv/9?=
 =?iso-8859-1?Q?nDs/tSLPutNBe+sNqpZGBd4xs7mPMH+LzYKQ6ylsE4wqZzw+Sm/Kpp8yFa?=
 =?iso-8859-1?Q?UKepwQiztVXleM4DZG/65jmJ5ERhbYbeZGFJLEQMkEivMHFprcr26Kjv4x?=
 =?iso-8859-1?Q?4vK1kz0yX+aRwVVDpGEckmgjoygYhvjDw3qHkt3GvpNWVflIdxuY7Ltvyz?=
 =?iso-8859-1?Q?gMxLWtb7iE5hmWonaSMvtuoBrSI76a5JjgSkhoKAYbpCB8aNsUEF5mF0xh?=
 =?iso-8859-1?Q?q72OhjvGL2eBcf/QL/4kVn8NK8biqoPAFA+pOwr2ykc71RweuKg9e1q0ST?=
 =?iso-8859-1?Q?dGL3odIKc9CZamurgdA/RsPM/s8y9FCKwRT2tdwX3A3d+ixYKEQbmRR01u?=
 =?iso-8859-1?Q?kW8xANzaBRfRfsWuoB86S8+fcbW7kiEUZueUWxGRP0vT+2ujN94tLsBzkm?=
 =?iso-8859-1?Q?qJCnyQ9C5SB2UjgEMn6hkw2bSuv9/d6BAXukRSCGVMS9fp4kezOwKuR0ll?=
 =?iso-8859-1?Q?KLWLRsN6HB4zwGxROXFk2PW185K2lr4UfxpiqBeeFUbVqkSYTyTSqQ3p4G?=
 =?iso-8859-1?Q?d3GcqOOgYHrC9q+JvWJRn+Z6q8YVFGErpjb1KBRqphFM8iVhnKEMrcSvBP?=
 =?iso-8859-1?Q?y0qTF1Knpur+Mk9SCoSl1efZ/zCi8YJn6XxV2mqYxsKCWyKxZCwCjAU7C1?=
 =?iso-8859-1?Q?RX4fJRR2QBFdN3o714qSIQVxfHF4EiuSiEVjQaNcqMs3zKvsHcd9aPhKnH?=
 =?iso-8859-1?Q?rovBGrqCkVQQFXBO4BLeMRF/PAPc9mrudTTDK7ro5vT0qJct6K5Xgs2QcX?=
 =?iso-8859-1?Q?Z25SDzO0cdpUmGMnLelqKdrAweCV/mNG6eWh4GdOmSK0pdik5+QHhwLBHT?=
 =?iso-8859-1?Q?EntKxD0jQSm28SDvbPvdqJtfRFBiJnwzv/xAXxrQBqnEpGfdagKZDumDDK?=
 =?iso-8859-1?Q?tdTeNYX0kDejWtnqL5muyr6XezixIb2s7AvTHYzw8fwVyrNaCzmYdIq07a?=
 =?iso-8859-1?Q?oAJg+BKc/VGYCdB/Tfez3vNju6HSgLJF2oGkH+tD1jUypRXANLTHH1LMis?=
 =?iso-8859-1?Q?uWfBrOSDnDmOtEQthI48vX/mVzqBrLMfMOoiCpRT5HWrFfg0XxM4E/xQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56a5c14-ca90-41be-d6c0-08db10f6ae48
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 14:53:07.4596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/UdavkBGxnGphLW8ZMVXO7Ojo3tYmffTv4gztQB1F4kjcyDWBl8D2g8K64y2J65E2ZktnJs4EAbYer3YQxjE/dnxBOHSdlS4snshon9tkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10699
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thanks for the feedback.

> Subject: Re: [PATCH v4 4/6] serial: 8250_em: Update port type as PORT_167=
50
>=20
> On Fri, Feb 17, 2023 at 11:42:53AM +0000, Biju Das wrote:
> > The UART IP found on {RZ/V2M, EMMA mobile} SoC is Register-compatible
> > with the general-purpose 16750 UART chip. This patch updates port type
> > from 16550A->16750 and also enables 64-bytes fifo support.
>=20
> ...
>=20
> > +	up.port.flags =3D UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP |
> > +UPF_FIXED_TYPE;
>=20
> Do you still need UPF_BOOT_AUTOCONF?

No, it is not needed. I will fix this in next version.

Cheers,
Biju
