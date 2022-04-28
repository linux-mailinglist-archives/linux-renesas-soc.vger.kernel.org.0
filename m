Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2D7512BCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 08:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244350AbiD1GqR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 02:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244320AbiD1GqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 02:46:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C901B98584;
        Wed, 27 Apr 2022 23:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebCGzsP2PllsQMqwx+BMMt3sau6FX2YSuiv4QkNa8ac+ipkNhCz7MjqR8TDsj8EnH9x8o2EUPYWQm9LggN/+BfRAuW/TwrqqMZXY+FVjRXNbcaXLd1AchPs5d2GG/vBRpiFrjQs/5VSVtkBh0KU1MsF3s3B3KKWo+bP7KYfsbVp8uxEta/VHK+jvC1DlkEPeOVDlrfMrpPVMJZ/uln0cGdm2+ggVRBaoL8aFIK4tlhUoRdM1vpkVhsLkQhFwZrZ3hofIms49sFUPQ3TxGA1XzpKxMe+MMbSyD58JyeQqul30pFZf9jimil0TQ47hWpuJMA0eYdJzDYGOOHt0uF02mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8a3UKRDTybKR9lKNgZOi7140yqkiH9soCebEc1yenc=;
 b=XNudrP99yGNfGyy2vQRPeC7GplEeraLkf6B8kwcRErDwaXfMttrmXREURkmNlcWH6J5gmn85BgzIDfMiH5hC3F9vpJC/D7g8FlQCHYSY+VpnxJJQyzsne/0Tyuw/UeG1LI6sKHEb0Y/xLy4eyph9o/hUG1b+QB/8O3VpieKY8HL13RakT5RqNecjXomEfyqmbbyEo7sLFcZVVcOdGfw7Qnz6YjK9wGJHUa1f7wIiOLZtFex27J4LmzJPWNNqcZtBm3X9wLQ7F1UjU1C4300NiIuD3Dc4qzMJjuIk3UgP/DGpk/SmfJ+lasRuR2fiIr6cdfofnTnoH7rfI4yk5fQraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8a3UKRDTybKR9lKNgZOi7140yqkiH9soCebEc1yenc=;
 b=f+jwJCDJEn2OOfMQBUDDKPsHRQdMAlUVbSvJGdsEwm5/1v590rp43Lj2yjgZx3erJOqTI6ECxxNPy9WQwmNRkkfO3kdfPerBOH9U+RvKxH8FdBk2pOTuQhBgk35BNjElpLmqXdU96//bvRvfleP2dSM+F6L7KzxvOLjww6wrID4=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB6884.jpnprd01.prod.outlook.com
 (2603:1096:400:b7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 28 Apr
 2022 06:43:00 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 06:43:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host
 controller
Thread-Topic: [PATCH v4 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host
 controller
Thread-Index: AQHYVGIIg5FJ0f9aNUGoWO97h322/q0DxSyAgAEn7NA=
Date:   Thu, 28 Apr 2022 06:42:59 +0000
Message-ID: <TYBPR01MB5341A5AB5F2AD117320824D9D8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420025450.289578-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVGbfaNXvy-0ArsE8VDC6ju-6KTeKcz9rziY9ReBGRkyg@mail.gmail.com>
In-Reply-To: <CAMuHMdVGbfaNXvy-0ArsE8VDC6ju-6KTeKcz9rziY9ReBGRkyg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d53356e-442c-4205-3ae5-08da28e25633
x-ms-traffictypediagnostic: TYCPR01MB6884:EE_
x-microsoft-antispam-prvs: <TYCPR01MB68847836A1D7A336ABDD8EA8D8FD9@TYCPR01MB6884.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LL21p2SEKp32SeLzjarRxYF0LBBJLdd0LrZgrDs8LPHLlZVFd6bzMXM/5bS7TEdt+ULZyGMw6B+RpFWzKZZtyXQ3OnjPbQbdE3o873Pv+lIG7cNMUraDi3L3i099BOWpkc654dAn2O7MLUD7G80HaFuo6hrmiN2WxL2k2n8h9pPphUGrtfRLcvo54DNG5INC1VT+ce+tBJEuagiTSAHFYju+UC+flDUyGKZHQMuXXwYioqU96brlBkeG5QKo40vrhZWYBy3QRiYyVs2Ctt3ikTxCI5E79cI0eWvRV92c7GNFrvmKb0iIkWvV918brMMHFQrpuuzxo4lcveagXhtTpbugL5nTu35D1tfns1/44OKlzX/izYBhHntHin63RgDS1GW1anOWhhUMSpNYCd7cwT8gzHDWU2ByH2m/rY+BgflgAQRnFYRkPFkRjQEFYdP+5nncy5pO7mv4iEDtB4QOjY2kFbArIqFV2xBsEQnYOHI8iXQ+bmOIn7C7qwkyeuB+Nh3GC8/DFpOU5G+Vcq+Pslh0wv9aZ9IHjn5siYZGij/88kE4nQN5LQV5LCmXKt5STKTa90BeuINWp8PQma/BWl5gm4njWA5n19AwKDXpuTvojXbLNnYqfyNp4g46VHKt9uPVJY66IcFqzQMSDuI+5+h62kdEmm+DJbfdOOzep2SfxD6b2J+FChJDsan15MUEBPTCYs/AR80shs1QJ2R+Yw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(53546011)(6506007)(186003)(86362001)(38070700005)(122000001)(38100700002)(54906003)(66446008)(66476007)(6916009)(316002)(2906002)(33656002)(4744005)(8676002)(4326008)(55016003)(64756008)(7416002)(52536014)(5660300002)(76116006)(66946007)(66556008)(8936002)(508600001)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZBqH5YY2jxDp1RHUkdmcQBU60QPD95HPQebyg0F3qgpDTxemPVyRJDZsae0C?=
 =?us-ascii?Q?Qa7BhUmQbc381Qiq2BAoQn3IBKqCz/M3SGxWIn8vFVIC/psFteVFb50oRs7x?=
 =?us-ascii?Q?DQ/SvqqgVEX8g9P6QBy5jEtUzO/v44sTHI+Rw/Gqz+iGWp2glDEMaLlvDv9h?=
 =?us-ascii?Q?5MQx+78HwZ5qiZZEWRRXf2qjTiOOGSv3SEWDiJ87DwwVSj8llQY/6Twl8NhG?=
 =?us-ascii?Q?q7iLXShZqAMQmLr035wuFBryz+tepP1eMkCjOV9hP3QsbiC892wv5Xirv+4G?=
 =?us-ascii?Q?jLeD8vTWNAnZafOaLb/j7VwPiJjS9irlurYD+kxkb3yUo5wPJejHvOU1rjAK?=
 =?us-ascii?Q?PFWS4vusHSQYi1aqB1162maak6vvxqBfpvDouw+pR8ZGyRgd/mI3xHHfmNvH?=
 =?us-ascii?Q?Gn+Og7EKrLa1I6sWwJIjJQxoogrXk+60qXMNmqQAUZDaeg4cNBUS2SRNgMoZ?=
 =?us-ascii?Q?1O1rrG/J1m81RJ5TcpYEO72wvI9Ms2iFo6We1quoi4eDbx/QRV7PBA2lpjr/?=
 =?us-ascii?Q?0KYIaSe19ogFH4RKD59BGyfnSyzkoyreKSpXi//RC11vsPxAGheBLtnQMTng?=
 =?us-ascii?Q?jalu8vCfsnUiKzuBzjR1fdvgU9iNARPMJctYOrKAkk59lwV5+n7DZR6enE0o?=
 =?us-ascii?Q?aaBI3iOdPDS1+NI16zKqq9ElJi+kgqfPh4gypATYG83eXTXZgo59Qgwv4V5V?=
 =?us-ascii?Q?7tQWa8JC2q57KCm1bubR6fhsnXVc5LqFfh+O9DpiYqeXLSvqMpF86n7zxINR?=
 =?us-ascii?Q?yC2StZ05AFCJhPOEdO3zCKKA+1HIbw4WQxesSUSlhOm2+kgvWriZN6hlUZKy?=
 =?us-ascii?Q?aeNyJVB4qHYgu9bzwpCZtEF6z0oqJEI5TEBsaSbeyBiQ2GLJCKtpnZYHwLKP?=
 =?us-ascii?Q?Df6ZfIuHVZJMWNLLq8SJhL4H7FnnO1dJEBVZ1ZvshugmS/M+5Do2Ws3i8aUv?=
 =?us-ascii?Q?mKi6brBhFH9ZzrNMQcmo5iQ+8yHOHmtwYlZrOtc9cc5GALUgQSdhUEXmfJX9?=
 =?us-ascii?Q?vcClYV68BkcHtmtLC7Reimtk0hlhntmct8V8sD7vofn77hq3W1MdMStBpZFT?=
 =?us-ascii?Q?cpJKYiTPhpW1hZqBsCOMTX1vu+hzsdTqIKRtrXphs0K38648i1tAqEnGVKG/?=
 =?us-ascii?Q?cY+mTYrcBB0aHSZrqlBZW2nSMYwPO9cQjlFUyu0BgmkLBHWqRzrY5L9QeMOp?=
 =?us-ascii?Q?zoRS/BAEY27SHlZCLiau/0Xxf+c2M7FHdAp3aEWVOEZIhSoRx0bQnSw8AmPh?=
 =?us-ascii?Q?HrfYyGCmOH3995VTZ/rE2Yg+aPrGjNLwwk045HdD2SPKSxZJSjKkiWIwj2AG?=
 =?us-ascii?Q?qQSB7bZ0ifUDAd1D1KKFooLFvdso8WK9Imk0HkGjI7lVG8bLZ7i3YBG0aP4O?=
 =?us-ascii?Q?MW2iqrYT5Nez7pASnMaI6co5d3kkde9VZpGr/14uT+rRAqcvZpWzi7n1vt52?=
 =?us-ascii?Q?MlQ/veaDEQA0jFLEhbXcuA+cXK5Q1HIvGY/kPQe6Vpx147eMnzlwP7JjjoiY?=
 =?us-ascii?Q?3vPprpYv+WC22wZ6M4Koiog8R8Q0TydW+6kN+epp/Os070upIai2grm+x5YW?=
 =?us-ascii?Q?kLahYz2U4wdUbYqHEB9z8WLHxu8tc9mntj1bfx1+QF3HTFXNrpOM8pkU679E?=
 =?us-ascii?Q?ndnNKlpctqKBoGbhfXDld22nnN6xJIPaGdt73fwtQecLlX2oCLtGh4n/AsSx?=
 =?us-ascii?Q?ACJuVE0X5lTqy2lRD3Gzt+zmhrK/Iu5TuYcyOkOvsGlEgI4BQAI9wFolkv1d?=
 =?us-ascii?Q?uSlvXDYEUkDYm8mUPlz6NSV3C2/w+tkuzfZ7oc+fy2M/VuIOOKvRxNZxeND6?=
x-ms-exchange-antispam-messagedata-1: E9QgE96N6LRbvYNGcuUnCLSh6rgfrTP1X4o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d53356e-442c-4205-3ae5-08da28e25633
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 06:42:59.9795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u64CY1ayWsWE/FXzNqVGmTYXPwDJLz4oWzl9pbeNtdB8uUbS6ND11WBf9CD/IbSWcy4Rew4kJeM0tFaTltunNY03OKTPuSzs5+R23Ai5BiZkWIfzCIUG5+NAKrJ+LQvC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6884
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for the review!

> From: Geert Uytterhoeven, Sent: Wednesday, April 27, 2022 10:02 PM
>=20
> On Wed, Apr 20, 2022 at 3:11 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Document Renesas R-Car UFS host controller for R-Car S4-8 (r8a779f0).
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Thanks for your patch!
>=20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> > +$schema:
> > +
> > +title: Renesas R-Car UFS Host Controller
> > +
> > +maintainers:
> > +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +
> > +allOf:
> > +  - $ref: ufs-common.yaml
>=20
> ufs-common.yaml says just one interrupt, while Renesas UFS has
> two interrupts?

I got it. I'll fix it.

> The rest LGTM, so with the above resolved:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Best regards,
Yoshihiro Shimoda

