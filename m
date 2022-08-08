Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF36A58C785
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Aug 2022 13:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242653AbiHHL37 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Aug 2022 07:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiHHL36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 07:29:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D402E0C7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Aug 2022 04:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ4V1NMRLPmg7wgqOcsxhmLcVmO8mzDJ3YV347j24ZEK5Pi1Y8up8b/qswEY1dWAjcf2H++xiNTWw2fZOCRf9Q0SiZYf/cA7MZ3XFXnhA7kis0lr/BDUC0Dyp+7Lvkw9DLq7gXRmrH11D8qOGshf9jT70ustYwikP1Q/iwQbBvUhBCZ+IPg3Rf1JKiq/zvlWRz9uLEz8p1yW/qV7TKGHMbdasOMWZo6LcM1LnXK4aYfNQS/5Xvzi5ifQ1qJMNmpGVy0RS4ymuRXHkmYfTZ2QgZ0+ELMByATgEhRQMKIIn7Puyzg6dC1TlRnCPpNYc5PIhQlNo87bVME3IETBHou6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyEGQmCvnWV9uBPJDeHcmmrfsVLIwYGTv8lvdaMfVNg=;
 b=eFEnGlcUso+0/cE2dSj78tr6PUDz+LbfrJ4daH6fvzq86mCA0Af1z2EKVtmY1PhhjJysq580EVnBoDMCkkz6c/gOngSyj6BXtTKgZWbbFFy4sPbRzJmwe7XR+b0eaV95kYifzkEJ51IWAv32fffVocuijw33otMhrIvHyLNFkwhoaNH4rxVk3nBDD6xpLZZ2K2ir92Ad99EnukBjhAzadC9w/u2wVIqDSNNuIlPoRG6EQAFgYt8oZ1pGcemxKKHD8PGILsFnax//+3LN03qKCOsVl+1yfdylkI4SNRyTXmRM4iD/l+hRuuZFLYYsqemWYb38+iH3l6BtuOy/165Eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyEGQmCvnWV9uBPJDeHcmmrfsVLIwYGTv8lvdaMfVNg=;
 b=V/Kwga3Y3x9VESXGMMz0Gl8x+6OKV/l9WGraJwTb07VwtwiKZ38G8GSWTnVOK6F8PR4M7wYMMObOkygewMQC8iV/xL7LfHVlD0rX4doHNh1jo+G0kKcWQDnXzxcC3AYv/gGfNmff40mnX4+qjuA3z+/9odzKK294MZ4gjL5YsnU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS0PR01MB5442.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 11:29:54 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%9]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 11:29:54 +0000
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
Thread-Index: AdioxJFO3fqPouQQR2WlJ+Xylqw1MQB8JF5gABB/tRAACHnOQA==
Date:   Mon, 8 Aug 2022 11:29:54 +0000
Message-ID: <TYBPR01MB53413344F30C38AAE3E7848DD8639@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70863A585C9F2B2B4ECE85D3F59E9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYBPR01MB534150654E57593E823F0C2DD8609@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <TYYPR01MB7086B4D90C7BCA36E6EF156AF5639@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086B4D90C7BCA36E6EF156AF5639@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 712065b4-1ce3-43d8-8a3a-08da793150e7
x-ms-traffictypediagnostic: OS0PR01MB5442:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KB31PVZMspK5k5m/OEOfa9NdU7tEmMi6Csrc/3yL2pu6rkoeB6QJd5396/H0d6O1greLPIIpbc862MuuNQUr8yxA3ZOtwDQFtaxEEaHuVEXyCUNK1JtdPE7N6AllbM1mB/RTAmY7x22eaPeTJd4ZbMDjV5uQeastWJ9n2rpgbQ2vgqYfHWrlG2YWsuKyedlWMtbsJWwP0oJVJlR3ZUFkckvxp5Lu4lbzMytskbcz/hgVMis0KWt4DbKk4cPfZR27cihpEY536313GEEiAyYsN+ftg9EwUH3eH4AuJ9tXYIL7nk3tSFbvSeCSlBPdB2EeNMnalsUBHjf6Qw8Q/AfPGua8nxLZHk6ZcQ5qKxwVatkC28gJfrNLhjJDhAgG7GMGJpo5nLP6P883LuwUyGR9cLf6J+VmxDISo5fBNu/dpVJ/JGIhXuMhL4S3PDG/jJ4g/gFhpk7hDhA5g4xW7rqgY9lPzcALdYYc3fCEoBaHyC3cpMk+au0CYEUrDN9kI6Iw/VU7jzl8xLdioxDSQdBlrlGFPfnAF20EfJSVA++yV1omqo/F+tniC4W/bsS6/BK5aYuHNgdFNQ2y+oPgP+JbCKMSTX/I7yIopxMxkWrdLrTYG/U7RUlZ0xd+B56s3zHK2afrcHhGMT6I9s6qJpRPW6I33ytgONadjcxVEPfOfgrQDAajTYS64Vz9UH3eIyPuMOp4yB7I5IZ7GUbo1bGCnvrpzOmUxpm30+WBdKb2m99xk7C3Qq0j+izsrq1n8fpLiAJE+XT17Zc3wmiJZRfpGS8+fapUSMr+YQaeI21u6lnp4zuc61w0K+3Yd82Dx55M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(38100700002)(110136005)(122000001)(55016003)(186003)(54906003)(83380400001)(316002)(38070700005)(8676002)(8936002)(4326008)(5660300002)(107886003)(33656002)(478600001)(52536014)(2906002)(71200400001)(66556008)(66476007)(7696005)(53546011)(86362001)(66946007)(64756008)(6506007)(9686003)(66446008)(76116006)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ZidXP0MFPumDLdXkP+UDv44MWE4FVO46TDtGzAiei6bXBsLJ7pUQ66sTcuH?=
 =?us-ascii?Q?yHEStZbz84K5shfMdm298AJa2pWPicCACDR8DYPitK7mv5H7RIF8MYe7v0w9?=
 =?us-ascii?Q?ebPCp4GNZFBR0ClC3UbDNAmk+vmus2AmhWDPRpS22BoOFhCc8si8r5SLgSnr?=
 =?us-ascii?Q?bJjmJJQtxPRyjfrHYb5ZKcxxOy02ONZmoverdKSWzFubH1XpaCcHjbVECY5R?=
 =?us-ascii?Q?aoUCrQGsfkf/P5WtC26K1BVWye78ByXml6ZwhnHGWwn//2qRg2Zk2LQMgLKA?=
 =?us-ascii?Q?H9Q4OB8iN2FdGijrtyURpF1XOyOYsqTZOd4gtbc01gUQjw9ojzioqwiobUVK?=
 =?us-ascii?Q?LbIJRYRjzWrG/a6JYsjauC8Ggi+raFiAIPvfndTN0+kcPw7A6Z6xv/RLIrI4?=
 =?us-ascii?Q?kENSCy+MU2X9ccnHCaNJVx62Hz1TqxLSAHcB8gUX6vMSF60ekf9ERttMlJys?=
 =?us-ascii?Q?iOHxyMNiwunXtQTrUitNXjJWHD+D0x+eetnytz4tm4HX5N1sJa4OJkiBVbtB?=
 =?us-ascii?Q?PZlGqNsg9rWZXnJl8ajSJP7LEXhgs27psO9Ail++ABcb37PJNrNhfF0G+kEg?=
 =?us-ascii?Q?UtYYFxBm/wy3PKbST+JfLV6dQDeBDt9a24Gf2/RsiV+lqBOTKhpgrpl3RDNu?=
 =?us-ascii?Q?TOUjzlnBnzwQ2pK6F9htiH3o+F9jHaPXKvaQjuKMu4ZQPKf6buQugp/wAQ5V?=
 =?us-ascii?Q?KBcxJILuRDPMU63alOJc1rcHZ3yyR4LMQo5HNEbYF1gSvmyoNgzsKAU55r9m?=
 =?us-ascii?Q?b4cQ0/Temyfqz8W+sR2DbmCtvzozZW9jlB0gvfiRb62YXVJWdCiQhkTteDxi?=
 =?us-ascii?Q?igj/K8zuKJyehQYHkg0C6HMFaq8VmOeRRxRFK/1t9KM4I+9Sr84QZ/9L/VLN?=
 =?us-ascii?Q?6sNIWdyVXCu9Qm0MeKTxQKFMUxe/oU4psTRbKR67UYR2g7xN2QG82X35kAkn?=
 =?us-ascii?Q?uVTwv8iolv48TDNaWxVKbewYf1FR67hbT2UXGHLM6XOKu1FyhH0M69cgUWOV?=
 =?us-ascii?Q?zMfnHr9FIGYDzC1vTJSDJho5o28tdrMNHkbJSsvNatGbhJFf4jpQi8l5IkBy?=
 =?us-ascii?Q?KMFljJ5MRDUqolfjyKEZDFd9xDh1xJYkdSJQXSk5aqAZYBLk+PptbfwCRL1W?=
 =?us-ascii?Q?fVZs8WP4l0xvE8nUFu2MRp90YKssSR0z6VLiJ6Z70yQpGRfM3n5rgWmSdEJr?=
 =?us-ascii?Q?ONZCoklhiHyqx5SJoavzDq8APLzx91pgDJW+mjAM2npvBWHFji132pxzOoTS?=
 =?us-ascii?Q?ttu5C/W2pY38aRji+Fm5vXmznXCMhS3tJ400m3LQI4dOO5c05mBdGtUvg7zf?=
 =?us-ascii?Q?dqykeJCcz7BpqsvZp400QFahYMwSMRA5fI4z/rWiVwqlHkpZKTO1zJTETpLp?=
 =?us-ascii?Q?RgVVosqJYuAatYbgLYyctSHupHk/JFpmKIcubyN6xovSmWnLzsYvRjy+8tS7?=
 =?us-ascii?Q?Sh6E/fa5wX5rdYbcWoM3faT2ueHG25qsqm4OV1s1rDKVb58fh4ew/3I/1ZgR?=
 =?us-ascii?Q?PwionKv9+yeTJBWnihpWmqPCJ1wCV3xpL/n9INrDKAXTN3/eBCmBYmZil59e?=
 =?us-ascii?Q?9LO0ForzT+nKYH5noMb0BREGV/62d2SOdjejCnLbFx3m4N0lmZHUH3YQJuPC?=
 =?us-ascii?Q?sEHVMfb/i5lS8yB7hW9jj73gFXDd4K1EzT4s+Tp7T8n2zsLtZrPfKQIF+aFM?=
 =?us-ascii?Q?JdG2VQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712065b4-1ce3-43d8-8a3a-08da793150e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 11:29:54.3587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDGsR5Ffnk0H/MG3AqyN5vb7CDX+Kbt1RiO7Z7Lbn5Sj32Px5oZ6vIo9YoeHPIACIeo4uK7z1sKc4wcovSHDpiK7rJWafFPczKsCCxfslV/J6iYXQKdXfrpSxuLbRB7M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5442
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

> From: Phil Edworthy, Sent: Monday, August 8, 2022 4:27 PM
> > Hi Shimoda-san,
> On 08 August 2022 00:47 Yoshihiro Shimoda wrote:
> > > From: Phil Edworthy, Sent: Friday, August 5, 2022 10:10 PM
> > >
> > > Hi Geert, Yoshihiro,
> > >
> > > I'm a bit stuck with the usb3 drivers for RZ/V2M.
> > >
> > > The RZ/V2M USB3 is very similar to R-Car Gen3, the main difference be=
ing
> > > where the DRD registers are located and additional clocks, interrupts
> > > and resets exposed. The DRD registers are still part of the USBP addr=
ess
> > > space, though they have been moved above the other USBP regs.
> > >
> > > There is however, one big difference. On RZ/V2M, you can only access =
the
> > > corresponding registers for whatever DRD mode has been set in the
> > > DRD_CON register, PERI_CON bit. That is to say, when PERI_CON=3D1 (pe=
riph
> > > mode), reading from a USBH register will cause an abort, and when
> > > PERI_CON=3D0 (host mode), reading from a USBP register will cause an
> > > abort.
> >
> > Thank you for asking me about this topic. I have a question:
> > Can the DRD register be accessed from both PERI_CON=3D1 and 0?
> Yes, that is correct.
>=20
>=20
> > > This makes role switching rather difficult in Linux as the usb host h=
ub
> > > code does some work in a delayed work queue, after role switch.
> > >
> > > I am therefore advocating that users can only enable host or peripher=
al
> > > in DT, and role switching is not allowed. Is that reasonable?
> > > How can I ensure only one driver is enabled?
> > >
> > > This unfortunately opens up another problem... So that the USBH drive=
r
> > > can set the DRD mode, it needs access to the USBP address space. Coul=
d
> > > that be just be additional reg entry in DT for this?
> > >
> > > I'm not sure how to go about this, any advice appreciated!
> >
> > If the DRD register can be accessed from both PERI_CON=3D1 and 0,
> > I have an idea how to handle this.
> > # However, I'm not sure whether this is a correct way or not though...
> >
> > My idea:
> >  - Make a new role switch driver on drivers/usb/roles/ or drivers/mfd/.
> >  - No describe any xHCI and USB3 UDC nodes in DT.
> >  - Describe whole USB3 registers for the role device in DT.
> >    (Or add sub nodes of xHCI and USB3 UDC into the role device.)
> >  - The role switch driver handles the DRD register at first.
> Ok
>=20
> >    And then, the driver adds xHCI or USB3 UDC device somehow.
> The role switch must shut down the USBH driver so that it no longer
> has the hub event work queue running.
> How can we do this?

I'm sorry for lacking my explanation. My idea is:
- To enable host mode, add the USBH driver somehow.
-- JFYI. renesas_usb3.c calls device_attach() for it now.
- To disable host mode, remove the USBH driver somehow.
-- JFYI. renesas_usb3.c calls device_release_driver() for it now.

So, I assume readding device_attach() for host can run the hub event work q=
ueue again.

Best regards,
Yoshihiro Shimoda

> Thanks
> Phil

