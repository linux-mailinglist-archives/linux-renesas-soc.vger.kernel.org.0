Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AA4507E7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 03:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358822AbiDTB7f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 21:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346534AbiDTB7e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 21:59:34 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FD0FD07;
        Tue, 19 Apr 2022 18:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN5LfoiZVd0dh/orApJDv+kE5HKv9zoqLJ5MXeTm4MoeEhWgf58XIR+5wof3jhPi9Fd56lHyslfcuJxf0JMNV9HaewVLtY+GHwYHA5DPMmjj0tGpcUXxcBx4zCOev+LkONv079duo215WBwjFJHfwTe2vk3vz/6Z3vtjqAn3dDzb4C6lwxUHlbaLqJJ97TE8QviJXDI+Bw3qKwOdx1FJCO+5I2PccN8rhscCkh/vBKrqYEEFlN5r2mdK5lOJcNY8ZopS+yIUtKjffGau4Iwbv3PbK5jfR5zzMx1vpz/X7X2PYgMcaF4XhAoESZljFTzilY13whAtMQivcWfgnsTvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPdWZDt/KwC41eeLqQfd/hWQ780+6T0Z0AkGFDsFeMo=;
 b=cxo+U5x7Cy064MDxXXzRVNQHX6dYWZp6b46MfbJAMifGWdmbOIesZMs5ueeX7zBYEaqQ0hsDYknVkRDH1z2WlSkcGNj2lrCiwoReHEo1aYA4LARdQCnLskR4b3aUYaV2A/YjFGnoZ7ATySF1lfEfL7YX2adVSdE3L5khu4kZKlAJV8/uqmO2p0mc4vRwybD/7s60ry6Pr54j/2MjoHM3keCE0lBrd4MTlx34V1Hq2iK1MPtH+BDxcN4M0HjhSOozv8s5wXtZMGcQuXbytkt6UnQF7SMlntXNK5gBgdfOQi6lwhrxN/Oq4zoK6hWqmiREAZvg1ckiNWmw8YXf5DdRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPdWZDt/KwC41eeLqQfd/hWQ780+6T0Z0AkGFDsFeMo=;
 b=MP2NugLBgUYIRbdhnO+soz9acXeNMLFPdXxhvyhShIkPtxk+1hbSEbA+Tq0uN9Ig6SFXcFZBIsm4wfyAwkYG0EJ9rE1zeDxN0vB49itrrzYMHxIxDGAFEWKW8U0hUUUct5jRUbshvzkVUN9UBfUqijAqhy8ieQ156eWq4A5KMpI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSBPR01MB2023.jpnprd01.prod.outlook.com
 (2603:1096:603:26::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 01:56:46 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 01:56:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kernel test robot <lkp@intel.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC:     "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Thread-Topic: [PATCH v3 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Thread-Index: AQHYU+WLERQam22oD0abU6QtyL7fR6z35dsAgAAlG7A=
Date:   Wed, 20 Apr 2022 01:56:45 +0000
Message-ID: <TYBPR01MB534124C367748AEBF9D6E4FBD8F59@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220419120316.209151-5-yoshihiro.shimoda.uh@renesas.com>
 <202204200731.hTb71eG4-lkp@intel.com>
In-Reply-To: <202204200731.hTb71eG4-lkp@intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0f0488-d21c-4876-5683-08da2271067e
x-ms-traffictypediagnostic: OSBPR01MB2023:EE_
x-microsoft-antispam-prvs: <OSBPR01MB2023D553916A1F977CB47759D8F59@OSBPR01MB2023.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VB7obnuhkbOijtSSkHq6gk+zOoFNlC6jMXUlvwhNb+zVestz2S0CC3xDI4WWx1pHSnygEUDBriLaHz55psELS2NLt5AHzZFieNnN/hSbfPXI+OKz/N1kYyeVpNuY64WkeB/bKYZ4lJM9qkf3V6UpWZXHakRvkA8qgnoL6EkKvPZMXkRwdWSIAJ57EjVuwD5zCB0AC9k3fUtg2P3ZC1qPH2sSwN1n6FbC/0a6AaKlNRS07IKz66vWeDYt2LWDKiXcusWtbUx4SFbbZWE41Pm3F/lfBt63QH6d9Roqj04rJoIqz0J5p2kXSfiSif/t/oR/qx0qVFKMxDOZuZxrAVdAYol0NXrqiWg9aSdXvofymkLevronAZM5I/nwgNa+WiDO0tT3MB7V42Zh3R2nqWxZo9O1maE6xXKr81Se9xLddo54vjoFD6YiIV51G1groe7n/FyNjY3u0CISggW1uOrZN1nV1SD50klDK2p0ECpaElAfaLnkvw/PpK7+zTsvEGWKH0xn2RbQmis4Ga+L7K3quiLfz7Yxc2iQxjzb7ankiAoojlyv4kQhj+AiMG/xKPl+XArgKsP4vOczu3nFM1vZRqIVKep0DhnDiAjt00vldVDN2Yz7tekGXQvcBrbGNwCHU4UT037a37r+NXq7Zo4asSjqBcS4GHfSfuzQgZwyaCXpcU5Hf4835KsRVUa/4/GpeBlQmOmtg6QqBBNct9hmkg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(64756008)(66476007)(66446008)(76116006)(66946007)(4326008)(110136005)(122000001)(38100700002)(186003)(8676002)(66556008)(71200400001)(54906003)(4744005)(38070700005)(83380400001)(7696005)(33656002)(52536014)(6506007)(8936002)(55016003)(86362001)(316002)(5660300002)(7416002)(2906002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tG42wN6qkZdEidzmnA2P1gLYTool+oohMKi0J5QN14c9ZYg9eBMteE90JDjg?=
 =?us-ascii?Q?GT4UhDPK0hzHdxiVrJOqfHuN7d6lU/WuShCMhnke0g+dCcinpNj+U+GlyWYT?=
 =?us-ascii?Q?KnBvdjaoOnwDh3aiZwXRLfMoCiFEnrmHUzMdMIkpr7Ux36JfLHW9dJLLAxXY?=
 =?us-ascii?Q?dTZ2YC+G9lPmPZyOcy6otSCpdrwozUHI6pJurTkAp/xDI8OBWx9KpNmOBv5I?=
 =?us-ascii?Q?67k5/0YvhGspONKS/30EZwYm1aNuAANhqAlHbVaCaU4K2STnY4HCh+aE+gDb?=
 =?us-ascii?Q?hMpN45LvU5omcQraKjwNp4F6WkuecTXrdoGMoAygiZcVQHDuPI1cSteDCTr1?=
 =?us-ascii?Q?8TJm1+NmQvlfYyrHn+x3TdkrZXA5OwqMVNOO8j3ia5MCnsyUSuBmxxALJzf4?=
 =?us-ascii?Q?HPc0Z3x8Dp68hUacb6tevmZy5JuP1dhISuOmu+peseQ1FHZO6QWRjOHvQ33e?=
 =?us-ascii?Q?epNBvYku/s6D1uPMhKkmh9TL/1gSH8wgAiS/y8CwNmdYcS1t3vU63KgtULRI?=
 =?us-ascii?Q?11gGmhaUt4uKSm+7QyC9lWoW8e17NmT+7oTMg7oSi7302/6Ooc1CLfby+yDG?=
 =?us-ascii?Q?/vKmSWKqhajwnt5QVpzdQ/XGDPcDDokDyytNsFOOR3W2jNY5/zh2tHlIEDBJ?=
 =?us-ascii?Q?iDLxw+bhyjlkEo1SiZvFN1iuXrAVNhsVSr0B5JKzdITHLNokuND8fY/IyYPo?=
 =?us-ascii?Q?71I8EQ+NIk615j/R151QbRu7n6dyFberQl9IEXrx2weieD+vb2y40/KvpPTi?=
 =?us-ascii?Q?PHDikIAtrlc0ksnlcD3hIhDCg29wu8RRhUgHIso2gba8FKWvTaBXdLdaOT+F?=
 =?us-ascii?Q?h9QjHaFnT0Wdzu917RxWOs/mCUFYyd7d5l6cE/2lsTJfRDTk5mDhulLd0d7w?=
 =?us-ascii?Q?yV48NXpyUL0anh5CYOx9R/278bcvr/3hoHIXM0brOjVgwyJhZWxUjuZWCtaK?=
 =?us-ascii?Q?bccORTst+qtfVQHBoJhlweEY0In6uaXzeQ4V39D71tSfVk3VoAPyg/ZUk70f?=
 =?us-ascii?Q?+rp2JluLQ4gucnVTDgUgcyk/IBMFTkdGv+5w1i6dxKgfWB5TPb97QWx4jzwa?=
 =?us-ascii?Q?QyQ4F6nweJ3E86KkaGqDgnUwu0gRRcHhiQjJ9GmyDz80NwC54T+zXlQM6p6v?=
 =?us-ascii?Q?MAVQydCBBCFQUQvKiIVB+ITOxBygu7qoEGkgrpQ6ac0gWpHsd7AuEPMruc0E?=
 =?us-ascii?Q?MddbEvvxaJEELU42ODk9fOnmWiZ/h7orshpF8TwCp23ELdkETzMB1TFrg+TH?=
 =?us-ascii?Q?RHhQ3NwuKhhYwr8vKpQCAPFS2+rTk31Neyl6Ux1G/ZFjzzqaXgX7JY2MEPMT?=
 =?us-ascii?Q?VaCZyO+HTAavqYWxgJ+9/bf/6MLX0fjSOuLKNYtHaNyMMbjddfnhqfmli1WE?=
 =?us-ascii?Q?CFAzxNBYpO9xSUW6eAGPCvhYWkBaFTOYHvfz/XjlqJskkyOfUZBXgQnI5uec?=
 =?us-ascii?Q?mC2EThauKytuoUg4WiNiIkBmAxFP7OTkiOFdb13JihdS/1kLxgsUlAYT0CZG?=
 =?us-ascii?Q?LuZi6iDi6OiLi8qbzc05SuOvCfnzSP2pI7Ov62f8IyK8+Fdm6allADw5ZJWh?=
 =?us-ascii?Q?WZzwImUVTA+2AuU1VAq0kerjzgLMowiamMNtwBbOqweSPu++cnJilSejRbcd?=
 =?us-ascii?Q?njsCvNQaqiCAT3hyZ1nd58dxTgFKltc52zKZKXxYMeldOEivMButNfPnpWdm?=
 =?us-ascii?Q?+FR9JSV/QrK4nIL4iiVehl3ySUsNW1kgaoxkxgxmQZw2N36E2jbiR6YUu6WS?=
 =?us-ascii?Q?w4BlKisg2wIV97KpEHzTDE34A36p+rnUJGgRXLmzoUbhX4UdN4sMs1AA72E1?=
x-ms-exchange-antispam-messagedata-1: orgL3O4Gd2Yeo33ZFw5jG28NJmuWg5h5yYc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0f0488-d21c-4876-5683-08da2271067e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:56:46.1313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trD9r83HJypPn3wT2q1eoVKZT/zSiUaNQeeeUMUBKH9ncuLydROrPW9edGtTj+YSEDFwEEQQCGVi2kONnmX2tUACooEEv4Btpifk/Vwq1GCwdbXaBIJesj8qLtpOKgAK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2023
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> From: kernel test robot, Sent: Wednesday, April 20, 2022 8:40 AM
>=20
> Hi Yoshihiro,
>=20
<snip>
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/scsi/ufs/ufs-renesas.c:304:15: warning: variable 'val' is unin=
itialized when used here [-Wuninitialized]
>                             p->index, val);
>                                       ^~~

I'll fix this. Printing "save[p->index]" is helpful here instead of "val".

Best regards,
Yoshihiro Shimoda

