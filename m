Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3B07B4B9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 08:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbjJBGpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 02:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjJBGpb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 02:45:31 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AB9A6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 23:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fa6b1VohrxIi0ZZWw7rGXsef6srYJ7LT6IGT2qEEUBYY0x4qzBpyo6tmOP7j/y1ASfSuegi7KC0Ix9U7Xf3RUg6KXPDdBf5EyG4m/Sk7x0W1QyCDAXIiEsAw7RJKQIf98Czg6tRdFZMeh7lT7VXcUx9RJ5QCQMYYcr9H6zxo0Y+3qY02TouMDnYULbCN12tPlIeAqXdXal0QLsS+Ff/M0jUJbxXQ9ilgp1mDCjd4GrGPE3RpTm/+n3ZEV3UnKWyzHHExCFpDkGslaAO6iWCsFdklpxYMV7acToT25YlpcLtlmmrL0N6+7V91805l+NCfA43QijUhmMRuUyaTtiTzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiXjLo03uRPG6NsY2jnsvEW2BQX2kI2iNCiDN5r8Uoc=;
 b=e3pH7aMoFsIu37lwRT/AvCz/ufOhGzEBK94eQddq+vfS3+Zemj2ic3JMLpgY7mAQw6g0YVTcSi45MJmKyqmNp4ae0dJRjzYo8HZuFmFl8SCSuQl8ivQCK1bx7ZDHokkM3iI+xZ8ivfLQ7dvkjmgK0FWyBFqI2fHsSzWXxHjL3jZXun0W87KnSyHkP9LO/R7l/csNpvE66bcIBjsmTEx9uHGrLNZDJGFwqxy3pAj50bhs8D5J6mklSd7vhlDEw60an+0TMUvbxRXgF00cM6eoEhkTbbHGuRVdZ9tykRIZz1rGL8KSF4n9wA+4NmT3B6YQilj/ialAUkgx5JbBKdaldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiXjLo03uRPG6NsY2jnsvEW2BQX2kI2iNCiDN5r8Uoc=;
 b=gIlQtCi2a/R7BFugHbebgbuU5XDeqzgJY1cCCc/SaGtvyHumUSS1uCeT22MbOfF5vGU5/0bCh8QBYqiWMmpbeiphuAsBFxsS3m2zn+DcFnGJbRMZQrsEuLASn53oiGETO98EwqXFDGgFVZSLfrDg9umUj9bbniCfnEmvn70c56w=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB11289.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 06:45:25 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 06:45:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: RE: [PATCH v3 2/4] dt-bindings: soc: renesas: renesas.yaml: Add
 renesas,s4sk compatible
Thread-Topic: [PATCH v3 2/4] dt-bindings: soc: renesas: renesas.yaml: Add
 renesas,s4sk compatible
Thread-Index: AQHZ9PUiDypQiXMxeUO2P4ihUk/FbrA2DMkg
Date:   Mon, 2 Oct 2023 06:45:25 +0000
Message-ID: <TYBPR01MB5341BA6512E467B63A6439CCD8C5A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
 <87cyxxeff8.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cyxxeff8.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB11289:EE_
x-ms-office365-filtering-correlation-id: 9677777c-657c-4e1d-8faf-08dbc31328ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Suln7cIrjyCf54cJoSj2CDg/jaUYvDoRdx6qFMSEOABwRfODV88R5TssvQWWeZ9eE44PNXUPFLtBjfueZM5uARKis1YKKEz++tLR05vYOFMx4Lhiqpzv14jnQUqiJsiqMwpI9WBscATtTt2Y5lm2PxuB2xejbpl+fTwziY+R0Zknkh4RNyaX7oYDs8PeEOpF8OhljMjpLVVrJ9X6vP0oXk9HQxcbC2FLUbakYPEOXA/eoaD5J/6weMtVLNgVUbBRvDkYLcKTqfcISX6tWSJ9KJGGfesH6lTJr0GrC/LFiaNJVplKZ2cqihRCvkGUa0Lvzqd1zL5b2d0uZznZ8JUoca/6lCujrrYNGjsMT6H3+OM/ySk9EzwsD2+dSoCAF9Xrl2JzMOBfzp9pc5joq+9Ge43M8PMKzv01fawZzYYGaX59WmyPdkHhQsOglklce11QrGmRP4tGWeTklQOkGCSr3dKnDAgDbSBOC/1m2g5zbUkBrNAkzhx/E4GHj12cuau6eKol/iQMSNptc4GzXzItpjD0gUfJB2j+npRxXiL51y9MhIpBdwRJDHWXNTyn38FIka3INrZzKyCnJN5ySjZFN1O06xk6SX5ZhuDkPFwCdsa11mD7HDof9A/ltswdrzQR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(478600001)(64756008)(2906002)(66476007)(316002)(110136005)(66446008)(66556008)(76116006)(66946007)(55016003)(41300700001)(38100700002)(86362001)(52536014)(38070700005)(5660300002)(9686003)(4326008)(8936002)(8676002)(7696005)(6506007)(122000001)(54906003)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?psaa3+Q/atjOQs8deDWQwYyj0TvN4pcFYbcVvhWxiJoJwHN76d/F72auvhB6?=
 =?us-ascii?Q?xS3I8Md0m8AFliF7HO9jdbXBKm/knD0HeoFsTCl1LE2fp0SIbXKrZyvdJMUU?=
 =?us-ascii?Q?RVxB/b+MJk6ynrzPeKMyRDazpJ+cggfMIkiwwWqPnhGCwlXsNXE3+amPf271?=
 =?us-ascii?Q?PeMwiH1idwYyVNlgWpPMFRmaB8NYEv4iwTbYDS+B6wPMRORIlscJSZPqLv1a?=
 =?us-ascii?Q?NmwGSItIAm6x+y3gNsT/Vj9EC71VIoYgzY20ayXSKKUqD1A2navj5Xlgtdtj?=
 =?us-ascii?Q?Y0dZ4hgh7/5y3aXajoViuFH3G2gVwDm26fUvHyL7NgMv36O8oW+nxgTKEhQE?=
 =?us-ascii?Q?oin7chPPDTtXpdbxf8MHUQb7wnDq5AdIY323MyRqVUungNHFy+NDsv/u+/aa?=
 =?us-ascii?Q?2UXW4p6X53smlPVDaxAfdPPDdHWxI6JpxS9+64EyOrHdV9YG86cS/lZOORdk?=
 =?us-ascii?Q?k84llrwyEp+alAyH2uwNh3Oq6tKMithSRIGG7OVRcyCVSgN3sIHCuwta1c92?=
 =?us-ascii?Q?H9s0k144ws21kCVVQC8H0q0nwMJwfBLbHzc+b2v/8egxGtI3U+ivPHv+n5o6?=
 =?us-ascii?Q?i2j4RiYtcCPuXW8RmVRpXXoXruTcug+7T5Ma0kv0ugWEZskQjhzsV4NaZtnp?=
 =?us-ascii?Q?1XSYoi3eIFdpco3Zfi1Qh8sJCpraGngnDWUBMc17C6sVDQ0UIsAtk6mQbTrK?=
 =?us-ascii?Q?wEd+ENpU/whpFkmZyxpG232gQxFJb8hIlqfmvjqdPHfSVuV9a5ZXBV65UUEK?=
 =?us-ascii?Q?Tpvued6XhpjqDNMfFkikVouwOt2UVLUy5DWiu+mC1YaIQWPOwkNXgnKYlZ9w?=
 =?us-ascii?Q?7UPC5jYu66lM6rkWLAO5LjcshTpJYJP7neYH+/INEyZ9fNvdB3zlqPoK6fE9?=
 =?us-ascii?Q?TWFO0+YKR9QdX4K+hZ1NeGx0CdzSLJoWUrrC1QzBs7OnjGTpCWLb/GRuB4O7?=
 =?us-ascii?Q?NfT2zxbPaoe7I0riBdREC9k1C+hTym7H9vrT5ohmb0exXLVGckxVd2RDsk6t?=
 =?us-ascii?Q?mcXzMaAgHn5FnkRel+F9F6E3pFJTLkvPVrfPIRjbmr16y9TSStSuLrhlsjB7?=
 =?us-ascii?Q?RzFtxZ9+W5eETw6D/5k15wmCxAl2ew7vjtPH4mArH97MspnXM95KV77PoMCm?=
 =?us-ascii?Q?TdkFMMQYndDPXK35ULX2YXtYrTJsZmOl+MQihLZUpjy7GE9olmaCBoFFuuXr?=
 =?us-ascii?Q?SvQdILUphnmBeLC/HLNsqYwUPrUAtsOTOS9PmARp0KU2byc9HpztKktOg3y6?=
 =?us-ascii?Q?SolOuz/wVrQyQm4V8flBlX+FgG2jXlwsO2T4d/lrTXTKu6ehYTW+TB2qbafu?=
 =?us-ascii?Q?PTC7LHU35nTOIK1qisGLZWNAP1hI7psn2xjouwyFhGZHJ/NDL38/Icz/He9r?=
 =?us-ascii?Q?BACu/jsMwwV6jVliRaXXPcO8Q4zNIUgqgrkmk4SkRwjHeaOhs40ADR1gUFTk?=
 =?us-ascii?Q?/YU2qZ10CstYMrsmzy25PnMa9WedbUxJhGjvIUsQh+pxLr56jNWyMQtx/DSC?=
 =?us-ascii?Q?AucQPAqGCLUX26/BVqA01n5ptfiMCv1G3wXcS6M8Z+O8Sxz5NVJqXMsgJt29?=
 =?us-ascii?Q?Y1xSs0d4kIi7LN6Y8e7lQ3/RM2j/DzdoB75cudj5N8KFkh+hxmu+1/UGner6?=
 =?us-ascii?Q?rMsjCC++AvgdlCndT2xUx2kWcIDiAidu2R65ZBwJ/jWfbl1IahJIuxhZruRy?=
 =?us-ascii?Q?5kqZ5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9677777c-657c-4e1d-8faf-08dbc31328ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 06:45:25.6860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STiaVPsWy2MA5tGTZ+hYi9ziPGRbhau71IHglkf/6gd1auwrzbfzZZafcaUpYuj8vGj33V6G8vN6Zb3HaAAPmNPg8xdbbPuLJL0MpKGC4vE5MvtzR0bicT9tXzziNn4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11289
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Monday, October 2, 2023 2:56 PM
>=20
> This patch adds "renesas,s4sk" which target the R-Car S4 Starter Kit
> board.
>=20
> Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index 53b95f348f8e..b2bdc26e8329 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -335,6 +335,13 @@ properties:
>            - const: renesas,spider-cpu
>            - const: renesas,r8a779f0
>=20
> +      - description: R-Car S4-8 (R8A779F4)
> +        items:
> +          - enum:
> +              - renesas,s4sk       # R-Car S4 Starter Kit board (Y-ASK-R=
CAR-S4-1000BASE-T#WS12)
> +          - const: renesas,r8a779f4
> +          - const: renesas,r8a779f0
> +
>        - description: R-Car V4H (R8A779G0)
>          items:
>            - enum:
> --
> 2.25.1

