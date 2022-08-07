Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A328558BE55
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Aug 2022 01:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiHGXrb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Aug 2022 19:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiHGXra (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Aug 2022 19:47:30 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32673B4A6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Aug 2022 16:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BePZceQcek47/k9gf3XlwVhMOa7T0deAI8eQrK6iCrKfoBTQnHjpAdq+oI7WrjkEpYvaBufYdcMd3dMza05iiVCMsv1+hIWuMvyJXyA3kxBhRe+QwxzPX8aw/u5LCtwW8HRKFICmycmpeHRzPbu720Gg693z4ldCh3Gx/IrMojo58B2y9SVb3lVna+4iRygIdChnDEpf4Ti4igSRDjvJgpYTQRLP6xpitBD8cIoSY2yHl8UUb7Q8+gvkW9Zs0dlabCnY3FZQ6IbZw5xHtfVlLkmLd0pEcKsDkPgsIgf2qRbQb+VqvxSWsdGbzqjFgyZlpRr3nHa6u1iiLzCTuAiMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmyfr79ZsX90h9rr0n0m9OjFE7mob3mlIJb+Yvm6t+s=;
 b=WeQm0EMRly55tJ5xf9HpKX5v6YPXH2aJt5VjQSFKdmbS9LSYq19OO8zIYAxl1UWJ+c6Yjbfk9Q+ADAJg1Ke+irLcJrPb5OlZQ0bKIEmA66P1ZG0qWMpG97OGWlw1NR5ZcV3b4l+bZ7mbzdcx015OfySpwoiHTeUFJdkD3q/gtd31Hi34by8JhuAHBdO5qPLyaCoe1fOfzRUGnagx/3VtlsdvE7ghbQrut6BEo0IFB23aTN8aRjWs26m2KV/AweFtoVMseCIx7GiLfGmcpS/NoYjqSpdHCqwd/W76vS/2AsCcBI8YEAKzR6e2xzz7Fa7B/KJCdaeIHIQThFTrfJtU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmyfr79ZsX90h9rr0n0m9OjFE7mob3mlIJb+Yvm6t+s=;
 b=NKu5P5xKrz3IkmpnUJsf4qm7S57ynctetmqOeYuudDQCi0otBeipZ13+PdaIAIcx3WOrwSZLyKe1AdUc9J3YGMPC7G6CnFDrliSE0x2U2rIt9Z6kX0ePKItoCHg81IWeplMtwGtxBhsC1Oq0O03gj3jQccn5bA6fknrjW4tlNfU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5296.jpnprd01.prod.outlook.com
 (2603:1096:404:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Sun, 7 Aug
 2022 23:47:25 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%9]) with mapi id 15.20.5504.020; Sun, 7 Aug 2022
 23:47:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: RZ/V2M USB
Thread-Topic: RZ/V2M USB
Thread-Index: AdioxJFO3fqPouQQR2WlJ+Xylqw1MQB8JF5g
Date:   Sun, 7 Aug 2022 23:47:25 +0000
Message-ID: <TYBPR01MB534150654E57593E823F0C2DD8609@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d73a6d3-77f6-45e2-28eb-08da78cf2e07
x-ms-traffictypediagnostic: TYAPR01MB5296:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: khBPwyIOKBXiXVdFrfMhwtEWKyLKpjORl27iHHE4WrYcTNCquG3TbV2uPHnTjkMRHrrTomOKjKF5eZghgxtBcgXkxJqXBhdW5+A2Xvrah0lLq5VcvOKyuLQMxBC9xcM3G5hsKR/mgev1bpNZLegXOEz3OSv6qk1DNmshTeaHQ3qV9DmK69MGoaVGGLErDp4yIlnzKN2o+4ht1FLrMAXzMFUmL9lA2aECwdCQm0kH1/XfRPN4dI4LVY6SPfvCYVkGeoVntoAOkIOh7Sgzu+Kb1JXj9NumhwmBxJdk86dTq7bOm+lzuZjze4SHNPXkATCivOUWT6vYEYgbA9BYxCaL15CTBJtXycaX85jQAagG+wzmzc3tKrrRLwmPlGCHLt40dnTlDg/oo2RTFTfFb6qYRC6DCRCo/5uPaRkcC1aGTSNjW1+p6MgOmZOWdAkOhB+BPF64TjkO9ohaer2CgNXqxb+BKb4+AgsxLoZo2OdBWHfwebkjvpMUgW/lJbqumm/3tebVRZqaRwDCWMPwtMsP8XuKhRwOJog79KLLy6DApINBcZk3GrEzOEYKr8kyqz1jrMuAEDlgq9pvhjZaMiXS1zxSiDZGCoLN4cIypA9dYWkIdnuTt/5AMLNela9VDpZGkQElUkFBrw1rZ5WIQ68wy4ColUTjUpIEtEnX1L2FqIygyFXCeB21Y8vwgbByJJMIeq535HFXX1YzHC68guyQiXoDVB7fWgNH+duOXhkwZb8lsc+fiYs2ilnH9uoKahl+vVtUiavyOfJ2Hb3dKYE8tF59nXV4oB3leIv5RKGcL4wgTNYJzErbG5ogivEzBxtB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(55016003)(4326008)(8676002)(64756008)(66446008)(2906002)(33656002)(76116006)(66556008)(66946007)(66476007)(71200400001)(478600001)(316002)(54906003)(110136005)(38100700002)(122000001)(38070700005)(41300700001)(9686003)(6506007)(7696005)(86362001)(5660300002)(8936002)(52536014)(107886003)(186003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jH0RZQExA6yUFZjKTqtbecGgQhuLbd2k/+oHkLnvpo5XlKzUFAQl7bEZUPjh?=
 =?us-ascii?Q?Js3O06NPxYN485m3lD/EgbkocefDSrZ7B6OUxl5qnLpkUu+MNE3MKYdKWKjP?=
 =?us-ascii?Q?9KBr0Fk5nc0bN8Qvr+yQcUjWSr4b8anAxCxoshZTGo9yFkD9fxVVPqPmQ7or?=
 =?us-ascii?Q?33f5miE1yWYNlOI+362fgU9RtSPqTY4EcAna0lcAepOvbzZHH7j426Jxzvqg?=
 =?us-ascii?Q?27k2Gb6FGNMSsAbP/qUpWnEAtrkTUf2LcK6Keylo44cGUZvPB6xWTuQqXAbg?=
 =?us-ascii?Q?RCeyWYgW6J2Jv89vpDUBzWJ24hZSB2AxHul8+350sKQgDRWLKxR5NnHROobf?=
 =?us-ascii?Q?NYeyNR63AAAa/CTyw+lS1jje45XbdkCWhtNU+1u2UFlGNLI/ulYL/t6Jj3Lt?=
 =?us-ascii?Q?k6+1y9JXrSJMrFzJUtO1Mb+V8XbWmFejcaFf+Sl2sP3llEhc4VfCArt6ra2z?=
 =?us-ascii?Q?J87tYlTckKQq9lcc7omDTfRMoAD75cFfQ89vtRwG57bX3McFd5FoOBnvbM6p?=
 =?us-ascii?Q?NlKkJUjEcvzyKTNtkNhqubApbIBmp0HOcuxELKymAb+j8XAYDsbr3cmeqKHI?=
 =?us-ascii?Q?peuE5mGSSEXYjuzPxgbuNkD10ZZWMmIJJfQ9shXG2S0x2w1Xi7jNfAbdIbrR?=
 =?us-ascii?Q?M+01C4iyHiw6dDuHMXA9uQRNMSKUo6H8Hou/elN5YVMZE3s5d2RybJC8p6Mf?=
 =?us-ascii?Q?e/AfflB37MZ9e4ZR9a3dIciNtEIH6KRv8TCp4RHe2nNBtxDju5EmOoQyyfDv?=
 =?us-ascii?Q?w07M9sVVRx9aVa5POKXpne4Lra8rYYbcESWQ53PQ8MsKEs/ljtJbmGzFvsgb?=
 =?us-ascii?Q?MByGenCLOO6yNgsu81+4jIingeoAShRorbljs4o2lHxbNSb+2Xk502Aylcay?=
 =?us-ascii?Q?LEKoGJO3rYZwPIM24UWBTuCAPZ2frbUieVs5KPLiKuIu59r8l8EXXqtnTlr5?=
 =?us-ascii?Q?2+gZlimyO32Cq9PNOg1p5etzfHf2xi3OBRrWAk9mDtrlZm6AFtPx0E42Fonl?=
 =?us-ascii?Q?BifrZOo3LoSUl1aHydHfpdxMxsw6OskDRBLrjcERRftYACGB7yZfX2K61cVX?=
 =?us-ascii?Q?sAgto1AzdU9y2dTO48hvTbR+kRuVg35Facp9DPkpbHcbBB72zjVZIr36S8Hx?=
 =?us-ascii?Q?CNjwiRtepvHfsZgLW2euAXWEd4JGpvvIpty/cXLYuxeqtwGdbyWL/XeVIfh2?=
 =?us-ascii?Q?ooZ8Tkb62yuO+7/kOEUR3T2J7yHaO/+G96pxFWa1qG8wjteucJBuwrjMCTys?=
 =?us-ascii?Q?1nfEBVzaeSEUAq3XvTTet6UwqtDJTv82ljGffzEl+yy9SmRdlxkDclKcT26c?=
 =?us-ascii?Q?OQligqpue6ddrRHcNK/W9+bTYAAV0kDdzyaCJyYx6AfwV0tkgAH3yoY+uAsZ?=
 =?us-ascii?Q?72wuhl56EkQJyonqsakn/wHBsoVVNJ23Pkcm6aiUdTdmlwbU3d36PHxRj1Qt?=
 =?us-ascii?Q?gM/b0Z+T9GNMKBixUEiLNeUCGTsltW86RVEXDhiFZhbmNT1s/uDXpUAznzEn?=
 =?us-ascii?Q?hKmhZ86SNVPLoQDlcrnRz82g0OURvsReMR921bxUyL2Bb6vrC4Zap+JqEflk?=
 =?us-ascii?Q?yC/JRfOz6RnLZODwkkBY8C1bxwOCMz35wd5ZHx4EKV9f7YAe6/hUcMNv31RS?=
 =?us-ascii?Q?VRzVVBhdJq97ah3PlkEXMiPEKCTmRLAIBkcwVfdPnwW7ov9gnicHsDmDpPWV?=
 =?us-ascii?Q?guxpJQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d73a6d3-77f6-45e2-28eb-08da78cf2e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2022 23:47:25.1974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+czIFB36Q6cDuL+aHuHnZ2YV+S6aAjhfTKy+EkYT3EswOcZabSheLbZZou61UYo2Fj8qSIpTO9np/tJvl21hrr2DpbDsfOAm9FtiRJGKGaespUZWMukYUgPt8mDHgvW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5296
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil-san,

> From: Phil Edworthy, Sent: Friday, August 5, 2022 10:10 PM
>=20
> Hi Geert, Yoshihiro,
>=20
> I'm a bit stuck with the usb3 drivers for RZ/V2M.
>=20
> The RZ/V2M USB3 is very similar to R-Car Gen3, the main difference being
> where the DRD registers are located and additional clocks, interrupts
> and resets exposed. The DRD registers are still part of the USBP address
> space, though they have been moved above the other USBP regs.
>=20
> There is however, one big difference. On RZ/V2M, you can only access the
> corresponding registers for whatever DRD mode has been set in the
> DRD_CON register, PERI_CON bit. That is to say, when PERI_CON=3D1 (periph
> mode), reading from a USBH register will cause an abort, and when
> PERI_CON=3D0 (host mode), reading from a USBP register will cause an
> abort.

Thank you for asking me about this topic. I have a question:
Can the DRD register be accessed from both PERI_CON=3D1 and 0?

> This makes role switching rather difficult in Linux as the usb host hub
> code does some work in a delayed work queue, after role switch.
>=20
> I am therefore advocating that users can only enable host or peripheral
> in DT, and role switching is not allowed. Is that reasonable?
> How can I ensure only one driver is enabled?
>=20
> This unfortunately opens up another problem... So that the USBH driver
> can set the DRD mode, it needs access to the USBP address space. Could
> that be just be additional reg entry in DT for this?
>=20
> I'm not sure how to go about this, any advice appreciated!

If the DRD register can be accessed from both PERI_CON=3D1 and 0,
I have an idea how to handle this.
# However, I'm not sure whether this is a correct way or not though...

My idea:
 - Make a new role switch driver on drivers/usb/roles/ or drivers/mfd/.
 - No describe any xHCI and USB3 UDC nodes in DT.
 - Describe whole USB3 registers for the role device in DT.
   (Or add sub nodes of xHCI and USB3 UDC into the role device.)
 - The role switch driver handles the DRD register at first.
   And then, the driver adds xHCI or USB3 UDC device somehow.

Best regards,
Yoshihiro Shimoda

> Thanks
> Phil

