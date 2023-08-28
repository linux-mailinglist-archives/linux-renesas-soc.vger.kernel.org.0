Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9205078AEBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjH1LZP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjH1LZC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:25:02 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E575192
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nvs59dQygivjTHEgFXBqaff6LiO+LlJ5O/UDQ+J0TxjI0Hif1GTO0n6LvtaiaDQIFg2H31maVG08G/3XZ81vAdxbSXanrbEc/wJ/iTt3Lt4pDKbtH5UmnxIbZojRAXvFC9rRLR45egbA6GS6cFI6PTMWPIjD2Ht+/0ZvNk7Sb9fu/Y6cpSOjGQ93rUk/UKR+jDKXWFic/VwGcXuyZqAxBLmDTMdGzTpGCMHv4oNMK72R4D8P0KULljAe+JxUCoUEcx/f8OHIjayiGDKNeeQjFYc3l+tGll3SaTipsldWrzeWBELMknQ2fsI6ntudjfwHG5NJhdcDU9yQCOR/RPhllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvJgT/Owmo54Ql8BRwwHcfpB5vYpv/aQ/F5uyd50DQU=;
 b=nOHWwVKFrDaowTPLiJQ4HocpJnvqmHDaSlxzPyhAbYpNOXLGBQHCWJBYfd0yF5L+WjTtdRm/KfmvpkDXQtsvnbTxkkA/QlAw9RBFt4E9yOuI4+gxxw/TANe+sinYJAPd6BcACYt4ohGNfnnrD9IUwPkbeoiRfyRyIUW4apFB415ExKQo4jM3eDGxfw6j1bpBD42ZToApxFBUS5F3n/eeYojaLBLH0yututXudU/ncpEgDA6S3UIjmDNoeyiOWIuUpqRFnl0a1M6eY722WMJJ+nc7N1xIX5ZRZqU/hp8YayJpwFoSJx5VcuUNsain7jcz/5JMuYgtd4cdfM6QKG/k6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvJgT/Owmo54Ql8BRwwHcfpB5vYpv/aQ/F5uyd50DQU=;
 b=VtDaeJHFYnh/2UX+kZ5x1wNHLn5hye9gbZp8vI7WMX37N2qIEwS/7WKY3AWYQ9rmoUBTx8ZMy+dr+uVgq11g7/yoRZlWoTqyUjgcdQWaUsdeB2IAVBXwG49/TeLGL8PduNrAiiKxr1eL1oRyu/BlyS2HQETsd+N7fmeZF/TLf+E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5490.jpnprd01.prod.outlook.com (2603:1096:604:a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:24:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:24:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Lee Jones <lee@kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: arizona-i2c: Simplify probe()
Thread-Topic: [PATCH] mfd: arizona-i2c: Simplify probe()
Thread-Index: AQHZ1/+IPG5mP22Amkir9jJSWpfwG6//jGYAgAAH8dA=
Date:   Mon, 28 Aug 2023 11:24:52 +0000
Message-ID: <OS0PR01MB5922395C9879131E7A2DD94A86E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826092721.55225-1-biju.das.jz@bp.renesas.com>
 <ZOx9MoBVYDr+Fv8z@smile.fi.intel.com>
In-Reply-To: <ZOx9MoBVYDr+Fv8z@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5490:EE_
x-ms-office365-filtering-correlation-id: 90e4c314-7c85-40c8-d4f5-08dba7b96602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kIFCAPutRGvZfVvs7TFc0Nj6MOLrAEPK6JKJNsaBTQKn6HuFzVzmje8woDO/8oUlk+e5lBaPBs1/pWBwbcnFHBwy6Dx3e7ULpJofrl6utxejtffur1Uq9cYtYQAsHOTC0qZlAjWTolrzaJ0/Gu//4dC8AKwfY5doatesRqA6b/1DL31fOubdrQS0/O3WBP0ejfhsVLebmmjY8f40hAbpZ/JbMatwtRuJkv7SksXp7ItE7/aVUocEJ3oe5hceOt7nFnjjm9Ct88xhXc8YEwtV/A/lfkISgv1EF/GYSe7yLjHGdlQo+q5G1BoLLwvo/shP7WHdbNkX+X4hAi14JFQhEC4BGEYBnCOUahMJXzt82BOUFrB+8Zjc+7Si4hQsAI0oTPlQT1KHlr2JVtVpdhogs5Um8MQL/hY5EywBfDoDk42itFqLNJ4/GY7eTaxbn/ANNseyW3WmmRcqPAQKGC+JB/BcIiOe/70kj7DhdMHGbyw9hLrA81ZrQqddd3e7z0c7rj3eWWEhl7sSVJ030yogKXH92QKM4iQGjJHXxpvHtn55XNfTw0cWB7kuCkZtuVL7IYgk+lpGJjEM83VXozH6ZbfCmEhhMs40EsgW6cg1qk7INAFVG/DtSO+wbTypzUad
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(186009)(1800799009)(451199024)(41300700001)(122000001)(38100700002)(86362001)(478600001)(38070700005)(71200400001)(26005)(9686003)(7696005)(6506007)(4744005)(55016003)(76116006)(66946007)(66476007)(54906003)(6916009)(2906002)(64756008)(33656002)(66446008)(66556008)(316002)(5660300002)(8676002)(8936002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2uCEGTfOnZPE7bRtdyrQSz/f5P4fYHlChU6W3i1vj5PrEg0XGl58SdiNA69E?=
 =?us-ascii?Q?bVDzEXMDZclJp2dR4fHNqqAA18qG/L0RajphOu4k9VFTj4GJTzmBI5zPdSpO?=
 =?us-ascii?Q?UA9wNpLbjXn63d2o7qDN+JRjl4AnU5xaUXPbibzVgd/KGEiWVIgebaAmj5Rk?=
 =?us-ascii?Q?9tryq7actel6OZ1Sb9zVW3TNjk6ywLpI3c7HxyCbnmeI8R841Sv3wCaREAZ+?=
 =?us-ascii?Q?u5MtS72LXPFj1iFqspkR+0QMU1wQzzqhD1uL9CQNOO0ZgzCP/R6P0zVNxu/7?=
 =?us-ascii?Q?59oxBZNR3yrxxio8cw5Tt7LDuezfuu7bZAX53XyAIlSErOrwtBitVLelin7b?=
 =?us-ascii?Q?BQAu4SttZKP8uRhnDz7XM8ndqroX7wrTg1PCRyy63F7s0MtgRQ5FVMVjgrJC?=
 =?us-ascii?Q?2Cp7fJGWrxLyQ6yTawAu+aln5//rlcJAfH9PGNtVlv4t7gwEemKNC2iNvVzH?=
 =?us-ascii?Q?WO878O8Yfol+cJQnvVGaY9uMvZ9GVuQckCPAbPnefS9fw6ua4B60JPqeMZ3B?=
 =?us-ascii?Q?XWQ36mKnfZJs7g0/nIBckHJCljFpY3dgFzHb5nq/4lR48YQOR/B0beTDfema?=
 =?us-ascii?Q?VBuUrOfHD04Fl/t22jaIwZcV7W0RP5OYQ/3YMV4ua3Nxf2jpoMcdyptmXfsh?=
 =?us-ascii?Q?N+Orq+7S8g+b+eku7xELy+xZl7uDO8nwsroCRc31HGLZQS32rPl/Oy+0tpZc?=
 =?us-ascii?Q?lnZVNVIWkx/qoNskbOgyN952mcgjK2t5RlfiDtNL3p1Bw7XEtfUE5HgsCwMN?=
 =?us-ascii?Q?j2es2pan3vxJDM/x2JQvhP4PZSwWikD4QqxqirlCJtcUmKB9JiCVCG3pyLcI?=
 =?us-ascii?Q?HCZYtODw7lmZwWTh8sqEymVO1xo0M4h4/0I9EMxowLziINBJ4Kb/FUeetv/t?=
 =?us-ascii?Q?DHuddQuKLifFBd8GskF3nGsgACxI3ctc8tAtlmAi4f7uen2HXHpaG7ABmET2?=
 =?us-ascii?Q?CARMTymY3cS0aeOPNc88lR/33U6uPFEOvqXZq7bIcHxX5T0fEkNsQgvFsfdI?=
 =?us-ascii?Q?tViIG7NmKnprtnBHQ6YCDoml94NeD+dawWh65z9rWvia4hFh79/7bJMhgIqK?=
 =?us-ascii?Q?7vvVGrmQ1mktia43wUTWTSGbETqaayo0X2hxVsfJWfveok6AHTyQIwluuZX8?=
 =?us-ascii?Q?0fNKIjqBLFFDQj8+ezBam8iXiDFffEq0imPQ8VFiEjp09Vx2jhJjuC+9nNsz?=
 =?us-ascii?Q?zZPjC1fSUSjEf3b6rbg5zVa4pQtoITfyCSFEWDOeAVtJbyzlrOS3ucyqaDO8?=
 =?us-ascii?Q?AlgvCF8Od7WMba9Qy4jGgDrscLXQGOLrsh4ldNoIVXtOxZbq1omUHewC7Cdb?=
 =?us-ascii?Q?pvMiHX0BMSkLQ7RB8/QUjLNGqrrChiBAeqfAhqqRxdBlLPyd4lSgO6MGC9Ca?=
 =?us-ascii?Q?uR2ojkN+jZPEUtoc6cFVgG7uKMwz7kzatOd53DWMSLp75fRiOv/T1cWTS+00?=
 =?us-ascii?Q?7L+Uh48JsQhFdo12axdQtgdE1Q1OYM4PXWA7I3Tlj0E8xHI25S3tqI5M+Wqb?=
 =?us-ascii?Q?sdv82eQfpeVUCN0N2AJ1TMtt2HYIu3+L6wF6t0nM98VpQNjiMXw1W/kCo91Q?=
 =?us-ascii?Q?c4wvnlr7BUBHPGRGsn89exS9ZUWAzDogxQbjqkFLSTV1oMRLYswJho7R97gW?=
 =?us-ascii?Q?GA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e4c314-7c85-40c8-d4f5-08dba7b96602
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:24:52.4746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVO0fui5rf8aivoyjmOVNocGUJyK8aqz0iWH0jmUIPXnpHcYYqE6RFITkA8zNoQL9Jk+Utnsq2lB3yROZU4BRX1l87VpMPHIEu4BK0L2n9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5490
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH] mfd: arizona-i2c: Simplify probe()
>=20
> On Sat, Aug 26, 2023 at 10:27:21AM +0100, Biju Das wrote:
> > Simplify probe() by replacing device_get_match_data() and ID lookup
> > for retrieving match data by i2c_get_match_data().
>=20
> ...
>=20
> > -	match_data =3D device_get_match_data(&i2c->dev);
> > -	if (match_data)
> > -		type =3D (unsigned long)match_data;
> > -	else if (id)
> > -		type =3D id->driver_data;
> > +	type =3D (unsigned long)i2c_get_match_data(i2c);
>=20
> >
>=20
> You now can drop this blank line.

Agreed.

Cheers,
Biju

>=20
> >  	switch (type) {
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

