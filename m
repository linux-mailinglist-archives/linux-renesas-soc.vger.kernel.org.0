Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D668358D72B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Aug 2022 12:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241602AbiHIKKy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Aug 2022 06:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242195AbiHIKKu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 06:10:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759DD1F619
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Aug 2022 03:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deygUoAo6gPgHHRcHsFE3mWc9SkS6yNLOHS28E0uuKmGP6e95aAL5nwGvgNimDd0qS1PiQLEtEH9wd2AzZSA+V/0oi7cJuFTEwoXKRZVMW9RStu5EeiIG6cJ0cNV3EKsTcJ7+TgiK0JheYZgDNqkP41i5ni2KhYdJ0EAR+v6e7aybecansMDqclIQyWWK/cEEIlAHCTwKfJsNl5w1pwH7MaJFfJ6DhrIPBON+f02pZcdCTEdwYoskswRMclkFDDsYnMIXn7o+EeVlQ9QemGYUCjDqLiCCV1oRcU8pTt1okqp0RIHLUkoz2bk0Tls+8Jus8Dll+fkuReQwiVTHcNIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKudsTlYyTgsxAxyRRLeXWfuJ0CxExT6evJ+9RGvORg=;
 b=XhrJo3D6U8VZZHQIgPIt3S5U8J4SdmZlbHhOwnW+GhzDI9dGpux5vMeYO5OXkwDTo5Lq70MM8/SiFnmU9zi9UK6V/kuRla6E7fL2sAVfcADUbuynYKg3U5V2QUgNPztWnWxUF6HUvd3+c6loLQJX1FP5muRlqvrYuhnmY3k85eSkdbjRpbndeTRKxwp3NqjL09FQnzAWlt46mCRRPjtw5VxnJaLo6Y0GdbDQ1mXCt1gt8PwCbFM9AN/xvyjmMdII5Z2MD3cK7z2xkN9T29NrKQ216wf3H9Gv01ZtZuK7TN6e+EYYKeK27hmVCukIuUFVsPH/aYl+idFyIkl98y4hSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKudsTlYyTgsxAxyRRLeXWfuJ0CxExT6evJ+9RGvORg=;
 b=WzxTvOUIteGQ1ZR+3+jb1BbFpqZWyMGSJTDTxTtkGh57/eFDf5O2By+anMRkWdVD1M15V1DfWp72dPDOzygLEf0aDDj0RCxfR2f4xARIJQMETGg5qlqwZlFT9/6glmJ+bQVtaryBbdwNXBLL2vZRl1Jjg+bKnSV3R7swrAhTyPA=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSAPR01MB5169.jpnprd01.prod.outlook.com (2603:1096:604:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 10:10:46 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 10:10:44 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: RZ/V2M USB
Thread-Topic: RZ/V2M USB
Thread-Index: AdioxJFO3fqPouQQR2WlJ+Xylqw1MQB8JF5gABB/tRAACHnOQAAvwPCQ
Date:   Tue, 9 Aug 2022 10:10:44 +0000
Message-ID: <TYYPR01MB7086CAF683F47E888C09B514F5629@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYBPR01MB534150654E57593E823F0C2DD8609@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <TYYPR01MB7086B4D90C7BCA36E6EF156AF5639@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYBPR01MB53413344F30C38AAE3E7848DD8639@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53413344F30C38AAE3E7848DD8639@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a096d623-57ed-4c1a-b1d8-08da79ef6c4f
x-ms-traffictypediagnostic: OSAPR01MB5169:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y09NcrrViUWg4bRJaKjJcjMDdOyouH1Edsz+eRcN240QTQ6uYbqWYFYuUHtC+fxey6hfugoz5nSVKPqGj6ldW9lyJw9aEdw29oEINsqBp9nPTNksg6NUzNbSPjTSj5OJi1HDlx7YWszfife7IJtHhImfTeY/HNJb1X3Wky1zQUk7cpCAs2FhdCEVA+hpZUzPk3kt7TrdeAZUJcXzUlNZt8jIbtcGx1OGQkzkOxGu8sZUBp+YZh6slsHQ5XrWWgNvdOY6VEXRhaH0jVmK7zlAYjdOcRLp+bY6MrLRNpKINTyteC8ah1T0xvjLCPtB/0RphY5LNY/N2jw/lXZ3OLH2RojfMX1dg6T+m2BxfNzzctssJiB+V8EirJs+Ven4dM8hSy7Gsl8emQYYfGK3hMSaZYUNrc7XOs+HmhaNldO78IAwX2wC+nN2yuEf5cxZMTuQUt1btIXNHY8liYYPbI9Bm0+fKl2n9CHnsDnpqb2G/8nj+RDnW1aNL7LPnfX6bJOfgp9Bqq9zNl/RcQOgs0Yu5GwEsVWocV7w8NMWi6/M1SU4iLPe+cGTYYw8wQwv5N8AZjvzdARvTc4ob0/VN0McsOIa6EQ9i3O47KSCORvY6I1Hw6OTJlKTuQ+BLswDhohD85DVcrjnNc6pB/MeWBUSI88KwcEkqgiXPOMrmuruPsEnm+8Oklxr3cG5sWUxwJEifehsdEH7ti/BACYetKVI1BlGQBgeZQYUJ2boGbi14iSRfeoF+Cbh4Exb1RY/G4vonOUJ4vghBgiiunt5sReehPK4sc63rq6uDO9tqfwpro3yaVMYWJkxH8MMU5qVgpKL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(41300700001)(316002)(54906003)(110136005)(55016003)(7696005)(53546011)(6506007)(122000001)(83380400001)(38100700002)(26005)(2906002)(9686003)(38070700005)(76116006)(5660300002)(86362001)(66946007)(8936002)(52536014)(8676002)(66476007)(64756008)(66446008)(66556008)(33656002)(107886003)(4326008)(71200400001)(478600001)(44832011)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EiDJTdEDk6rQ4OyLPJLpCwvV2nB52DPopFSUSFWif1p8leE0alQx1DcamBYP?=
 =?us-ascii?Q?7f3JCP4GXPZFA7gGQJ1tpKx7sXmnjT/oyZPuChTR8B1EI1F6+/2GofFm1jOY?=
 =?us-ascii?Q?5hnoAZov1urNnzMqMZM0aJ+Rzo8NB8JvDkpgbnobb0QQfhzY1qm29JaKhmYl?=
 =?us-ascii?Q?mDApdy47b0A1hLAvVN3FckBCSKL8PXwxBBMFt3yLWaKbzo+hViuwiqUOnQob?=
 =?us-ascii?Q?elO4DWefHrxs0aYgi1mgU55E43BB/ikzjWMkpa1wgmdhPni09N3aImLzCrnS?=
 =?us-ascii?Q?A488xGJydCcTz0ukbcJzvs36BLtFVZziZuvyWaax/z8PfaOAu1rdNmG6rMTp?=
 =?us-ascii?Q?r/gOVBFX4yRpqpgtHGcVlMS0LwhkCbswOo5XegwaDsJwm90tWTkelr65al8R?=
 =?us-ascii?Q?gUcALhNco65QZzhWE1NC1R8JCTaRhPs5pJ6K1YxJIbND0xjgc1TnI5a7rC5M?=
 =?us-ascii?Q?8hMH6WFlsG7YKvC5uwDgCxZTLyHNk175gYbFX6ppR19Zd8JInDC1E39Gg9W4?=
 =?us-ascii?Q?PT53JeRWRKT8ljLxfWXYPJsfN50EVXvRxnjI38/RgcHxqL5g5KpzecPNoWVZ?=
 =?us-ascii?Q?C4hIpaNAflvx6QnkPvFMRh54scvQijY3bO0dmGi+t72ciuWkBbDs5THvMDKC?=
 =?us-ascii?Q?x8CiSGietJByqhUmkFG5nNT6GE2B8/PTFFTj1YE5CBOGKr/+0K2GgLSRC5XQ?=
 =?us-ascii?Q?FMmXBIrNvIjTTbyDVS5nMcnChjph8d1wvCXb2kCTW7f1CoAQqLSY9fpXx88O?=
 =?us-ascii?Q?A+CyHi4qAsTS4qg5e16X2yC4gBqKaAQPRrAERmhLtHsVhW5rw+uaIyJrG1OP?=
 =?us-ascii?Q?Qr6jl39vpr8JAkXtnc5Jnw54N4U3BhvumLKgZbS1nZhDqrgPpVVzc5/DYKcN?=
 =?us-ascii?Q?9kqroOF9kSMnC02I+pCiyqZuDNAHSntZCF/d4ZGHZXyANDffYrfCH36nDj9I?=
 =?us-ascii?Q?ucdH48DrDdt6scpSmPmkj6N+aoaJLg8pmzNYyTh4JcQ0OhThOFMpMU71gFQ7?=
 =?us-ascii?Q?CVUD3ioGm72/5eYFIjwIm72sax/cf26SM2GWhrJSFQRzyu6AhZarIqO+IGbX?=
 =?us-ascii?Q?+9DurTyhCl9TlWNV42cZb0jW5xuZ7xrjfSUEsg3y3yHnlhg4FwvMEUsX+Uk8?=
 =?us-ascii?Q?Qv2Upfb1vKQmvNykxdolU7jF6ODJ69/ovi+9HhUg5pq1odBly/AX66IgaEpn?=
 =?us-ascii?Q?CN7ihkcs6AOXnC32eJ+tK3oSYipDRVTaYcir1TJ9vEOCuzimJfGhKJEdoF0u?=
 =?us-ascii?Q?1rqRR66vJTar6Oq9mWw2MfBFTGwjoYkg2EfwujiBRA9l6ByV+3Hp0OicGRYw?=
 =?us-ascii?Q?j0OasbAtrtFX/AtwoHsYsAiVSWtJfR46AvU8/VnwDJUYi1XF3ZRBwvo1zPpk?=
 =?us-ascii?Q?hqmbWFqYnWh0s62uAHMDGRub2ASAWnvP3qSL5l7F3aG6KToNtdnNXxmxm6sQ?=
 =?us-ascii?Q?FhMFdhwuMxz8/6GL5ZbGyWF+TDOmNX9pDXQOHk8QHw7W6CwLyLUSSGRdpCdF?=
 =?us-ascii?Q?R3nvq0KPwGo3rpBox31VfdZPjYdUbYwFJavlyRoKMzmloOQLnMkZiHa09WbL?=
 =?us-ascii?Q?tdGa8cF8vQI43tieUsUp34F3ICcFdtN/yOX48QZiOgcgeNGUd0MSPprUdMT4?=
 =?us-ascii?Q?4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a096d623-57ed-4c1a-b1d8-08da79ef6c4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 10:10:44.7028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +fduDFA4+defAitg+i65+AUKqrEK2aDFrtKanzLJSe8xmPcuhKDcdtkG+p7ZoBDS+tNEc7HLS7oWhOqZgjghRDuKXfqUqQ9VrKjRdalCA64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5169
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On 08 August 2022 12:30 Yoshihiro Shimoda wrote:
> > From: Phil Edworthy, Sent: Monday, August 8, 2022 4:27 PM
> > > Hi Shimoda-san,
> > On 08 August 2022 00:47 Yoshihiro Shimoda wrote:
> > > > From: Phil Edworthy, Sent: Friday, August 5, 2022 10:10 PM
> > > >
> > > > Hi Geert, Yoshihiro,
> > > >
> > > > I'm a bit stuck with the usb3 drivers for RZ/V2M.
> > > >
> > > > The RZ/V2M USB3 is very similar to R-Car Gen3, the main difference
> > > > being where the DRD registers are located and additional clocks,
> > > > interrupts and resets exposed. The DRD registers are still part of
> > > > the USBP address space, though they have been moved above the other
> USBP regs.
> > > >
> > > > There is however, one big difference. On RZ/V2M, you can only
> > > > access the corresponding registers for whatever DRD mode has been
> > > > set in the DRD_CON register, PERI_CON bit. That is to say, when
> > > > PERI_CON=3D1 (periph mode), reading from a USBH register will cause
> > > > an abort, and when
> > > > PERI_CON=3D0 (host mode), reading from a USBP register will cause a=
n
> > > > abort.
> > >
> > > Thank you for asking me about this topic. I have a question:
> > > Can the DRD register be accessed from both PERI_CON=3D1 and 0?
> > Yes, that is correct.
> >
> >
> > > > This makes role switching rather difficult in Linux as the usb
> > > > host hub code does some work in a delayed work queue, after role
> switch.
> > > >
> > > > I am therefore advocating that users can only enable host or
> > > > peripheral in DT, and role switching is not allowed. Is that
> reasonable?
> > > > How can I ensure only one driver is enabled?
> > > >
> > > > This unfortunately opens up another problem... So that the USBH
> > > > driver can set the DRD mode, it needs access to the USBP address
> > > > space. Could that be just be additional reg entry in DT for this?
> > > >
> > > > I'm not sure how to go about this, any advice appreciated!
> > >
> > > If the DRD register can be accessed from both PERI_CON=3D1 and 0, I
> > > have an idea how to handle this.
> > > # However, I'm not sure whether this is a correct way or not though..=
.
> > >
> > > My idea:
> > >  - Make a new role switch driver on drivers/usb/roles/ or
> drivers/mfd/.
> > >  - No describe any xHCI and USB3 UDC nodes in DT.
> > >  - Describe whole USB3 registers for the role device in DT.
> > >    (Or add sub nodes of xHCI and USB3 UDC into the role device.)
> > >  - The role switch driver handles the DRD register at first.
> > Ok
> >
> > >    And then, the driver adds xHCI or USB3 UDC device somehow.
> > The role switch must shut down the USBH driver so that it no longer
> > has the hub event work queue running.
> > How can we do this?
>=20
> I'm sorry for lacking my explanation. My idea is:
> - To enable host mode, add the USBH driver somehow.
> -- JFYI. renesas_usb3.c calls device_attach() for it now.
> - To disable host mode, remove the USBH driver somehow.
> -- JFYI. renesas_usb3.c calls device_release_driver() for it now.
>=20
> So, I assume readding device_attach() for host can run the hub event work
> queue again.
Ok, this sounds reasonable.
Let's see if Geert has any additional comments.

Thanks
Phil
