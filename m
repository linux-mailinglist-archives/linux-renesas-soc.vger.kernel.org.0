Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFFB3BA836
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Jul 2021 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhGCKSW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Jul 2021 06:18:22 -0400
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:48645
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229993AbhGCKSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Jul 2021 06:18:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee+11FF1sngYcOmWiLYX6V4eiOm4r1sv303d55OSGUmonPOBszf7f17nedSrGOXSKY1dVo8ZezukDHzWpdVr2OXc1hjpwlmBGhV0nnsE7Ze9biTK9qRdfUcd+dMutnkebm6ar4Iiiek29NQy7Sa1Cb/jD1EtP7Asiyx6Vr2xcEwthhWP0Zxx05yoZg9wgL/fRFBDDXFR/ASgOuvbqVdRAcj7uZ3D+xJ1lpyTzLhz7Mp3ngQutgMQCAR6kPCD7JgpuLzpXc+8glfh7cJjxJ4PiMeL3FsoBrE8riirrrNcrAnU6UQu4UI9QzUvifacz7MB4AAjT0WVXBYK8uAZvoVkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qe8bjP2cALr7YBmv523UEsyGDsGWufAyyGgG0lVUuVM=;
 b=WdCyi4aMpW9QaMcfF8j7a1TCUJ/qD2eMqzl/M5ef4mr1gAeX/YtclYgUFb7EcaZsLgKcDzweujrxjTnSOwCtlEUyEPsCBHnOAVLeg/9q8iX7qLbw1gp+/f2bth43p4b5nAV+LpPjfTiPd5dri1yIPFmKRk9utz9EeAMaD6Lcd0ZS6kd46Ad5UzAzaVi/57AowOck1l3n7x+lz75T5JHXPxyADF3jCkmBdHN38m/GSPbivNQEeG9UEtb4fxE/0xNLP6lNYdOXxLbBbP1MIlsSGaDj0SHm+LElXHtgh6QN1X9XHYrANqch0KLJOaQmOUBSg/C6E1A2Tu22ZGKM0+WMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qe8bjP2cALr7YBmv523UEsyGDsGWufAyyGgG0lVUuVM=;
 b=GVOKao9tUHQvZbM4KNcOBq4NqrqtBmSWpLPSvvMz9h8J/KbF78LHzbduh7TNKR08bmVhj9QVXdvntwiHMmoR3kyJgsnEsOqK+NJATjdDMOSMxd2IRRD5et9HOU01HF4s9LorG9CWCEDZl2RCUrMj981M7lWsExF4Oro4lfkVvuM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (20.183.20.197) by
 OSAPR01MB3570.jpnprd01.prod.outlook.com (20.178.101.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22; Sat, 3 Jul 2021 10:15:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4287.031; Sat, 3 Jul 2021
 10:15:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexander Helms <alexander.helms.jy@renesas.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        David Cater <david.cater.jc@renesas.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Thread-Topic: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Thread-Index: AQHXbtAXZfPZ6grop0um3CZz1s2UNqsvO/eggAD/HACAAMw34A==
Date:   Sat, 3 Jul 2021 10:15:43 +0000
Message-ID: <OS0PR01MB5922EBC035DE87B794490F69861E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202107020640.YyVoU69S-lkp@intel.com>
 <20210701232258.19146-1-alexander.helms.jy@renesas.com>
 <20210701232258.19146-2-alexander.helms.jy@renesas.com>
 <OS0PR01MB592240DACD7D18609EA70AE0861F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20210702215102.GA20007@renesas.com>
In-Reply-To: <20210702215102.GA20007@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [86.139.31.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 639e4968-916d-4f8d-065d-08d93e0b8482
x-ms-traffictypediagnostic: OSAPR01MB3570:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB3570F5F464AB7CF96707E367861E9@OSAPR01MB3570.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ICkYwHpFujsH66TPVnpjOku4jJs6sptRA9Cr5Ooquz6zTASsgfvpeK10rTGE5AP5L9qo7qNo/DAJgVuFLqspnF9yrv9+s03aAn8JD7KwRg5l4a5JNsZgnUCQsCdLFIszpVDNiQauluxGr017v7Xzv1EYyHexBZfkRhMptuniAWRTxuV+mbCiMDsMDBTH6RUqcpwqYgrXWxMCN7qqXacfCIASfMYsDfE4UFGOT4YEiUUC5vcKw+i+3NkDH/BY4BsxhjqpdXmc8LQMre6Rb39WQ8C7YfuQYL42e1J/vx/PmKHhOa0uQsuDnMqZzmVbQjkwDq4t4mrWZUwc4TAD8uIfNcYzkkdijnCgzd2BpBnnk+ItZoUDzGGy+frKjdxHlv2LzmPtiAE2gmlpiETNKem+ByJz8yWfVL8kfEc9slJY01swZn1tZBU2O4WlWvchLkUIgUf0fTcamp0kqUV/xlF4d6RhHNCDDzgr9qeLZeme9J3F9U/AZGhFpuemN+KiqgdwXcWKJnFCmC2XeLv3oE+Cb18zSx/nOuRN7ImkGg0Uy0HzAX/KnI4sO8WTuVsM52sOecgc7gvJsDZz61LYELalGMUG0eEEm1MG244SW6pvAUazxLH5B3ogjfI+pKX10PlaoF0eCCDHH4+5pjzNAZEMPj/xRKVa6QuSfgSMdI7WTuhVDzFFkgvSA+mOmOokENiXkAC55a0rKTsj/t8v+Br0kpNBBmFe5AfJt1VHiY2ijQ/6bKrd1xLGiLQN/9mm/lG741nV+zoMazoE5NYL4y9i+PcygAkGOfjJtBFP1tyV0QQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(376002)(396003)(71200400001)(186003)(122000001)(86362001)(26005)(6862004)(45080400002)(478600001)(38100700002)(8676002)(52536014)(4326008)(55016002)(83380400001)(30864003)(9686003)(2906002)(53546011)(64756008)(66476007)(66946007)(6506007)(54906003)(5660300002)(316002)(66446008)(66556008)(8936002)(76116006)(33656002)(7696005)(505234006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iGxCD13bOw1BtCVWfGIi20K9OvrJa+2LGneudrSJVxneAsqUsCd36j+ElBO9?=
 =?us-ascii?Q?z4S1pnM4CsmvIhHgXgajWsf063sVpn9f7LJM5TC/nyej05M0HBF0MZELlcdA?=
 =?us-ascii?Q?N2GhQWTrEz76//A6j/l6IOdP89Yyqz2uXaWEDGB2h94de+RMVCQTBjOpmrYp?=
 =?us-ascii?Q?wHAppLlGLyBkHcLy/yF/WT+SWUa9zndB7r5v7WMmUfEtWY+mcjALIi6/2/7H?=
 =?us-ascii?Q?DAzssQ4I6doL80/ARUzErJOzI9/s2v6pc/I14YoNr+77Bu6NemJqLIGTsP5D?=
 =?us-ascii?Q?fola975YQERzKiey1y38tBSIO+DqoKWOTrPNGxk5Zs3z46QNCkHE4tMk7Sd0?=
 =?us-ascii?Q?9OKJfy0L9EvyCazdCReMbwIzbOJ6JXqJz3kfGWbfF8L1ViXINbF9xfWcgo3u?=
 =?us-ascii?Q?elknbm9R9X4pYgpruWsIIB+z8ZXEO6KJsnzLwnRcl6ePXDxNUlVLdX6r3ZA9?=
 =?us-ascii?Q?C0fxc1HOXIpYw5pYL+M2MNSIhywTLTFbWw2Tgfee7vwW4JEy5rFtKv9PfAxd?=
 =?us-ascii?Q?NJNvo1BGcHHJjxK3MF9XRUp4hqvPelvVF1RdwU65SWTN4uvw6IJeS1RGtJWW?=
 =?us-ascii?Q?A40o4+0mXAENNj8yXpBFvQ3ewx08XwgYVNRdwjs4dgr+Euq1nnHV9UiHUiAC?=
 =?us-ascii?Q?9ZsC8n2w06yWr3ZOqdXhAFauBfx4czl/Me1L8XNmImH1OKdCXJX8bBmdLRMl?=
 =?us-ascii?Q?D8epR5gNN71O5C78vQzGPobILQLXWqA52Q6i5+aI5ooCquQQTO7W9R94S1Mn?=
 =?us-ascii?Q?CrK1xbYH8nsAmHm03goQ3CWeDGTURwl7GqOIOvUC3lixQDUKpwQe0p6E8rKe?=
 =?us-ascii?Q?GXYMzY7oJ6Ynsr0UQ4uLrV9u5adJhvDV/xYQ0ZROqe2JwqCZ7+pG9JHV/8DV?=
 =?us-ascii?Q?IH5vIld5niHv0pCGbY4op8kofKFzW6qI1Kz9QOcvepbvGckDVaJOipZgXfhf?=
 =?us-ascii?Q?kXYAN+DezYBXPXAiBMoUmHq4Un4NSkHEVESshq2KyB4EEBOnw9PHyfoEUVJs?=
 =?us-ascii?Q?NECYAOzGqM0szoZwU38fJrFeU4uJWeLkanS1xdVpFE9qLQvzgRPqkQ/hp67w?=
 =?us-ascii?Q?CS46d2rKfDHHpS+tee6hcj1CBf+vbWl80pyaSIl0G9Zi6ftBsc2GT6q/snyu?=
 =?us-ascii?Q?0CpHMBjANDMPP7LhgFO+g4D9iDQVCs7T7y+wyVRSAt7rRmCuahoL4pcYS+Fz?=
 =?us-ascii?Q?TG5gmx/BIO3AV6VFY5H6ZylTzjt8Z+XKUMY6o8hMdirvJKdWKeZ+YLf0onAf?=
 =?us-ascii?Q?SWDvvxFk4B8nWqe1AtFW4oHDvjvNhrNOYS/CXyu0xoAaIGMS9spU98+7dRCD?=
 =?us-ascii?Q?3tk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639e4968-916d-4f8d-065d-08d93e0b8482
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2021 10:15:43.1780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dObpUt9C9lk9sxWZiWErl2NI9UzFsYXpJULhkY0w94N5Vac2ppybs6D5AhJN3f2JF62/JDxiW4bQM/AK6RR0kYqF/YDBlT/pU5GJCYtJQ7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3570
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alexander,

> Subject: Re: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
>=20
> Hi Biju,
>=20
> Please see my comments below. Also, I'm new to the LKML process and
> learning, please forgive any errors.
>=20
> The 07/01/2021 23:52, Biju Das wrote:
> > Hi Alex,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: Alex Helms <alexander.helms.jy@renesas.com>
> > > Sent: 02 July 2021 00:23
> > > To: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > > clk@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> > > Cc: robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com;
> > > geert+renesas@glider.be; Alexander Helms
> > > geert+<alexander.helms.jy@renesas.com>;
> > > David Cater <david.cater.jc@renesas.com>; michal.simek@xilinx.com
> > > Subject: [PATCH v2 1/2] dt-bindings: Add binding for Renesas
> > > 8T49N241
> > >
> > > Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> > > The 8T49N241 accepts up to two differential or single-ended input
> > > clocks and a fundamental-mode crystal input. The internal PLL can
> > > lock to either of the input reference clocks or to the crystal to
> > > behave as a frequency synthesizer.
> > >
> > > Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> > > ---
> > >  .../bindings/clock/renesas,8t49n241.yaml      | 183
> ++++++++++++++++++
> > >  MAINTAINERS                                   |   6 +
> > >  2 files changed, 189 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > > b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > > new file mode 100644
> > > index 000000000..d817ec46d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > > @@ -0,0 +1,183 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd=
e
> > > +vice
> > > +tree.org%2Fschemas%2Fclock%2Frenesas%2C8t49n24x.yaml%23&amp;data=3D0=
4
> > > +%7C0
> > > +1%7Cbiju.das.jz%40bp.renesas.com%7Ce51e24d06083403a3d0e08d93ce73933
> > > +%7C5
> > > +3d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637607786063741484%7CUnkn
> > > +own%
> > > +7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> > > +CJXV
> > > +CI6Mn0%3D%7C1000&amp;sdata=3DBIKHeHpyG3vloEEO02HzM6TtWqQtDlSGRMifOQV=
p
> > > +rPI%
> > > +3D&amp;reserved=3D0
> > > +$schema:
> > > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fd=
e
> > > +vice
> > > +tree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das=
.
> > > +jz%4
> > > +0bp.renesas.com%7Ce51e24d06083403a3d0e08d93ce73933%7C53d82571da1947
> > > +e49c
> > > +b4625a166a4a2a%7C0%7C0%7C637607786063751443%7CUnknown%7CTWFpbGZsb3d
> > > +8eyJ
> > > +WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1
> > > +000&
> > > +amp;sdata=3D3XhlKhlwT3hr0KVjynaiMlqMC94tq3sEYgNH6LMf9Kc%3D&amp;reser=
v
> > > +ed=3D0
> > > +
> > > +title: Binding for Renesas 8T49N241 Universal Frequency Translator
> > > +
> > > +description: |
> > > +  The 8T49N241 has one fractional-feedback PLL that can be used as
> > > +a
> > > +  jitter attenuator and frequency translator. It is equipped with
> > > +one
> > > +  integer and three fractional output dividers, allowing the
> > > +generation
> > > +  of up to four different output frequencies, ranging from 8kHz to
> 1GHz.
> > > +  These frequencies are completely independent of each other, the
> > > +input
> > > +  reference frequencies and the crystal reference frequency. The
> > > +device
> > > +  places virtually no constraints on input to output frequency
> > > +conversion,
> > > +  supporting all FEC rates, including the new revision of ITU-T
> > > +  Recommendation G.709 (2009), most with 0ppm conversion error.
> > > +  The outputs may select among LVPECL, LVDS, HCSL or LVCMOS output
> > > levels.
> > > +
> > > +  The driver can read a full register map from the DT, and will use
> > > + that  register map to initialize the attached part (via I2C) when
> > > + the system  boots. Any configuration not supported by the common
> > > + clock framework  must be done via the full register map, including
> > > + optimized
> > > settings.
> > > +
> > > +  The 8T49N241 accepts up to two differential or single-ended input
> > > + clocks  and a fundamental-mode crystal input. The internal PLL can
> > > + lock to either  of the input reference clocks or just to the
> > > + crystal to behave as a  frequency synthesizer. The PLL can use the
> > > + second input for redundant  backup of the primary input reference,
> > > + but in this case, both input clock  references must be related in
> frequency.
> > > +
> > > +  All outputs are currently assumed to be LVDS, unless overridden
> > > + in the  full register map in the DT.
> > > +
> > > +maintainers:
> > > +  - Alex Helms <alexander.helms.jy@renesas.com>
> > > +  - David Cater <david.cater.jc@renesas.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - 8t49n241
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > > +    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
> > > +
> > > +  '#clock-cells':
> > > +    const: 1
> > > +
> > > +  clock-names:
> > > +    description: Name of the input clock
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +    items:
> > > +      enum: [ input-xtal, input-clk0, input-clk1 ]
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - '#clock-cells'
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    /* 25MHz reference clock */
> > > +    input_clk0: input_clk0 {
> > > +      compatible =3D "fixed-clock";
> > > +      #clock-cells =3D <0>;
> > > +      clock-frequency =3D <25000000>;
> > > +    };
> > > +
> > > +    i2c@0 {
> > > +        reg =3D <0x0 0x100>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        renesas8t49n241_1: clock-generator@6c {
> > > +            compatible =3D "renesas,8t49n241";
> > > +            reg =3D <0x6c>;
> > > +            #clock-cells =3D <1>;
> > > +
> > > +            clocks =3D <&input_clk0>;
> > > +            clock-names =3D "input-clk0";
> > > +        };
> > > +    };
> > > +
> > > +    /* Consumer referencing the 8T49N241 Q1 */
> > > +    consumer {
> > > +        /* ... */
> > > +        clocks =3D <&renesas8t49n241_1 1>;
> > > +        /* ... */
> > > +    };
> > > +  - |
> > > +    /* 40MHz crystal */
> > > +    input_xtal: input_xtal {
> > > +      compatible =3D "fixed-clock";
> > > +      #clock-cells =3D <0>;
> > > +      clock-frequency =3D <40000000>;
> > > +    };
> > > +
> > > +    i2c@0 {
> > > +        reg =3D <0x0 0x100>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        renesas8t49n241_2: clock-generator@6c {
> > > +            compatible =3D "renesas,8t49n241";
> > > +            reg =3D <0x6c>;
> > > +            #clock-cells =3D <1>;
> > > +
> > > +            clocks =3D <&input_xtal>;
> > > +            clock-names =3D "input-xtal";
> > > +
> > > +            settings=3D[
> >
> > optional or required property?
> >
>=20
> My mistake, `settings` is optional and should be in the schema.
> I'll fix this in the next patch version.
>=20
> > > +                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00
> > > +                01 07 00 00 07 00 00 77 6D 06 00 00 00 00 00 FF
> > > +                FF FF FF 00 3F 00 2A 00 16 33 33 00 01 00 00 D0
> > > +                00 00 00 00 00 00 00 00 00 04 00 00 00 02 00 00
> > > +                00 00 00 00 00 00 00 17 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 D7 0A 2B 20 00 00 00 0B
> > > +                00 00 00 00 00 00 00 00 00 00 27 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                C3 00 08 01 00 00 00 00 00 00 00 00 00 30 00 00
> > > +                00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > +                00 00 00 00 85 00 00 9C 01 D4 02 71 07 00 00 00
> > > +                00 83 00 10 02 08 8C
> > > +            ];
> > > +        };
> > > +    };
> > > +
> >
> > One question,
> > Full regmap or just overriding few registers which is better, assuming
> the device has default values programmed in OTP.
> > Again that needs {offset, value}???
>=20
> `settings` must be the full regmap. The next patch version will have that
> clarified in the schema description.
> The intent here is the external configuration software produces optimized
> settings and the results are the full regmap.

May be it is ok for this device.

I am also working on a similar solution with versa3 clock device. Most of t=
he values
are pre-programmed. But to achieve a specific use case, I need a different =
configuration.

The external configuration software produced a full regmap. But comparing w=
ith original pre-programmed values,
It is hardly 7 register changes. Also I need to define clock flags property=
 in DT. So user can decide whether
the output clock from clock device can=20

1) change rate
2) read only
3) just change the parent but don't change any other configuration.

Regards,
Biju


> >
> > Regards,
> > Biju
> >
> >
> > > +    /* Consumer referencing the 8T49N241 Q1 */
> > > +    consumer {
> > > +        /* ... */
> > > +        clocks =3D <&renesas8t49n241_2 1>;
> > > +        /* ... */
> > > +    };
> > > diff --git a/MAINTAINERS b/MAINTAINERS index 0cce91cd5..882d79ead
> > > 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15575,6 +15575,12 @@ F:	include/linux/rpmsg/
> > >  F:	include/uapi/linux/rpmsg.h
> > >  F:	samples/rpmsg/
> > >
> > > +RENESAS 8T49N24X DRIVER
> > > +M:	Alex Helms <alexander.helms.jy@renesas.com>
> > > +M:	David Cater <david.cater.jc@renesas.com>
> > > +S:	Odd Fixes
> > > +F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> > > +
> > >  RENESAS CLOCK DRIVERS
> > >  M:	Geert Uytterhoeven <geert+renesas@glider.be>
> > >  L:	linux-renesas-soc@vger.kernel.org
> > > --
> > > 2.30.2
> >
>=20
> Regards,
>=20
> Alex
>=20
> --
