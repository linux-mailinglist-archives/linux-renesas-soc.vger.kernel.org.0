Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99381500422
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 04:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236489AbiDNC2I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 22:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiDNC2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 22:28:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603E740E7D;
        Wed, 13 Apr 2022 19:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2CEn5zqwES2uQDTRDF9WNEKU6cBl45euF4A1k9Gd8JL54ZNM7t5Z+KihCM1hVuYxkl0SXewghZbz0dN3sTgDtahY6VnlK1pIR1UjAvZS0liF6TQ4Gqe7Uwds/3cyllHixpJulN7vr26ZLGnODIfUtXi8BQe8BEagAEKMX/opkHEFtOtZpAAC4o3s5dTuAbQNYtgDtHPMOKpB2IyOjmWTR3NKWjaffK8+0k73VBlNDUTtY/OtW1D/RQTGBw8g4fotqTWrxMHkOqBmw4L83rCABtaAeCayNqH0h8GBtqei9XUapjE9YKkwZCSBxn6uf72DE/cA7VHkbnfsHsIFAIbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIZIvs1djLv9xLbM33Uuuk8ecuA73pTlmdfW0JSuUCg=;
 b=YKjSHxwk3mtGctFPGUwy5huFa1yKsT3W50oufq0H9TwGZzcrb+g6/YQMeXktnWyxF8PUR4ajgqIrLcXIj2TDwCsO774VbYT2/KdP+VhadgUxlpV53Er0M5rfXZL8DUuf4GPVsGYgsSfTsw2Q8sD0i3Qio+RWovpGEgMMdQ4zr0nsF6WRUS5U4zi/JWeOAvainkSuY6HIRiwahpsXfnVQ1KxPx6DSJ6TuHUJLaY+Chs+W5Pt+KK/6nIE/EdJzaVqC84fZxmtsSq1T5uUZ/C4DKfZKg/e1BfjIKyMu/cPDU272d0NuNCy6wxJemL2fRaLuW9d0TmRepePJ8Rn2MKCjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIZIvs1djLv9xLbM33Uuuk8ecuA73pTlmdfW0JSuUCg=;
 b=mjovtB58Hqk3t962Y0daGxt2Ti0At+0VDmYQJIGgLrmSKACM5aYf3+5jql/i4RyKAJ1jcxQCf4r4iY9nJq9dM4/8QRmifUE1+b3Z2pvP32yPHQoIBGMQFVyeq2QN/ug2Wffx7tlXytMIU+CRXREZL9PDO1kbqvnO0Cs+FTyDxLo=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB1714.jpnprd01.prod.outlook.com
 (2603:1096:603:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 02:25:42 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%8]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 02:25:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC:     "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Topic: [PATCH 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Index: AQHYTkAdDdgyY+yoV0iX2zcyeMTTEqzr/A8AgAD6jDCAAGvhgIABTmtA
Date:   Thu, 14 Apr 2022 02:25:41 +0000
Message-ID: <TYBPR01MB5341FAA62F80AF7C7B06B25ED8EF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-7-yoshihiro.shimoda.uh@renesas.com>
 <b189e6fc-98b5-9668-d22c-1144d5741071@linaro.org>
 <TYBPR01MB534192EDF0C76F77A797187AD8EC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <1fccb130-2807-4376-a1d4-db1d44e6a7ef@linaro.org>
In-Reply-To: <1fccb130-2807-4376-a1d4-db1d44e6a7ef@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ddcdcbe-b88a-4786-71ac-08da1dbe12bb
x-ms-traffictypediagnostic: OSAPR01MB1714:EE_
x-microsoft-antispam-prvs: <OSAPR01MB1714B8817DB41F6F78B4E0E5D8EF9@OSAPR01MB1714.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kv670kCB+9uINNy9ZjLD94K2H6Q4+b3v0r4eDNi+fg+HNdsxVlWIW3uTps1OuLQmnRAiu1zY6vsL3ks16WW2iYwnrYu+q6nAq4pjUEp6y5gyCht2FioXD4DyxCp3+pHBFKO/QWi3FjaP8FB7mlfuagqy+sND3E8i+UWIOvCdzerYyojAQ1E+XMyqNbfG8pOGSUDyB8Dgm9O9bsYKLShKrXbSK8Bt9bJshhsTsg5WstgG8bES6X9G0LlS1+1xLEmknA6i3LGuzVXGqUj/nk8mD3VaCuX/GQ4D2bdW3WVrGn245spoAg7KlAbq22/qN196wF+xFy54nSvqOiIOpOeXMdawFpT1H8H0f6XvQjotgfqL6HkduB4+Z/II01w/pLfae+bv2O9nWCzylSmH9WwK0pZ/5OTZJ5d54xq4bTgrA1fNw6Adls0eSLfhLmZBQQXl41ScYEiaYakzPLsSGOvTijp4+OKe4f70BHXY36NJcsOqmONDHXYKaH5qfO3TipIKTPk61Hhnyvz7b9jfVl/71tzolbLEgrb0GmWr55C6ynTTMi6kdmIDDMp5YhXAAfKkFx8zS3Y3PYmj9Ati3mfGweFLn/Tnwxe2dRfutOTcTDUQlr8vrOmE3W4ZHz/O1KfKyY0w3e440Pym2X3q1s6zpMKorroO2cjxo3q7mkyypRKOAMlAESVbWQrw1FV4kRvKV0HHicWRr6bI+fNqvUtOzZ0BNwemqQFY1C9Zv3CWaI31NqT9X8TH8GVQThawWTXGsc0nZCvo3PC1rfKH7I+dTCE0hLFN5rW8p5vwQtuSS0U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38100700002)(122000001)(9686003)(54906003)(110136005)(7696005)(7416002)(4744005)(52536014)(86362001)(38070700005)(8936002)(5660300002)(508600001)(66446008)(55016003)(76116006)(66476007)(64756008)(66556008)(4326008)(33656002)(66946007)(316002)(186003)(8676002)(966005)(6506007)(53546011)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4BSjjkaxIWiCaBfTmZlOjOC676ZDhDsGi3SZjuLZEzEh26Ce2qzzB3XImSyn?=
 =?us-ascii?Q?tYuc6EkzsNeHGJiPYbPIeXF6xMLBVb209EVo9sjeyGSDlsdg+dIFC+xPO2Ck?=
 =?us-ascii?Q?HH5KNg2xOuJvy3112dCWcX14uWPEJp5wovUDc/w2zcY/qwMbcsvCzjI3NZZX?=
 =?us-ascii?Q?10YXdZFstth8zNRhiiLjLwWo319+ECIUQoC9XBtAZeR73oDFd5nYkiw/WLXF?=
 =?us-ascii?Q?wMLxOwG7NxWtcey2KU9lw/5Hy4b+MDKnhFHSwLziI3Tb0ILPApvnelqwsmwS?=
 =?us-ascii?Q?BiGg9HTvkiRja2k8Qh8p1xptDacmSUeZLmVc+OopirxASr5wDydvdmGNTzhT?=
 =?us-ascii?Q?5+VZHZ+JbhaH2OveLEK/3pRfyRNMKvfxwEYbSsvg3YBM0dRLPgOZ5gDqiVvG?=
 =?us-ascii?Q?WaxZipfwqNSJ49UHgHXslUsnjMJ2tgzLptkLPREqWU0LojL2UywlWeg9LWSJ?=
 =?us-ascii?Q?x9b5qa2U3s4d9CHNlRFeWZfC5Jj3rWOVM1+ooqPdMjWon4DDzRF4DAe1HanS?=
 =?us-ascii?Q?h03YeQOUf6JHaiAw1vXELViH95ac151q2F0ISAszmyS7/NeFchbbnSmF5KL9?=
 =?us-ascii?Q?EQXNmAAsjAWMay3Y//PqlLGUT8U+qvznv7ATw4xAB2KiaffK9dxumpHJpbfv?=
 =?us-ascii?Q?YGxCjfa9pdVcJBUsEAMhuWCg2AhHKRwjC24zljUvE1ywz+/Bg962lsBFZ+gu?=
 =?us-ascii?Q?zH/qcIARst17fYxApyhVoK1/BBwejIX0YCGrBehmM268/EHmnpyLmoVxykof?=
 =?us-ascii?Q?LSKoMXJVUDYwdHtDt1bIsM3oUgCSnmXkQsi0BfuTKlgaOPFpBCO+3GRjk2Do?=
 =?us-ascii?Q?v7Ww1Vv2CgflneCPK71cYF0DT91yKJnGDoWdxle4RfRr7K35EeHf7pmFFzZK?=
 =?us-ascii?Q?GNFA9LXA07Ka98zKxwKPWDR9jH8dcgc02luGwfOj6nzYo+9Y9I5XfghSGhky?=
 =?us-ascii?Q?2tCkcFiW266+5O1pbLZDa4HALcR7ZyyLA2ElqThQX1Px96h927sIl9f+0NcU?=
 =?us-ascii?Q?jgMhYPO5swzwEDNtejQSZ3pTDpYmHYD/j/hLE1prsgTincItkGA8GeMlMzYm?=
 =?us-ascii?Q?3EphD8at/jC5fXsneYwL0jj3MYhpXvxnSIRFeEBsNARBk8euyNaBrqw96SNs?=
 =?us-ascii?Q?V46bg4LpUbkg0SS+lzAfx/XuHr7Gj5GfB4Arqcy1uhHWf3JC7AWMR28j/bmx?=
 =?us-ascii?Q?7+wnsYqSXOeexwZEHExO0TpoXiIXeSHKEiTTFbkpF36F1Frhp9IH4hw1wajZ?=
 =?us-ascii?Q?QB7kc+3lSz8S9ZiIvrQUgVyBabTD4jw+GXQjs19qPz4yMQX6Fe2L00S0Lpj/?=
 =?us-ascii?Q?3dfw+DG2dQ1h/SLEqvXhUGwJaJAN7npICb2SJBWI3kerPJp9tXZoJW+kCU/Q?=
 =?us-ascii?Q?m6Fbv73x5RXAXcf0sNoKfYgormLyp+E2kW3O9uFpjdWK5LL+K3ygJsPDoCTO?=
 =?us-ascii?Q?7UJHpxGiq7DSyi82pGfZpPQBPE0X4wtgcl1asgyb6iPh+UT7GswpTbzhp7AZ?=
 =?us-ascii?Q?e1w9hIa9+456SEVKm0AzYBuFanYqOiipNg3MYBZQY55J+cm4jFRjMxEufnn9?=
 =?us-ascii?Q?b2v8+USgfTZiLE4u6vlB3xVozhAfMy5eY05zTmJ8aadK0SfHq7hpgznJ5hQV?=
 =?us-ascii?Q?dEVeYI99JdgjvmVhAXxIb0+XiRi/pkAViKkENqamvXi3wfsVeyMw46dTBQet?=
 =?us-ascii?Q?SJv3jRxoRvdQl4k8L2P3f3u7v2iuc60Y/XyYwM8g9mhgt7a+uqFaCIn7W2fJ?=
 =?us-ascii?Q?um4HTuBuOga1JaA2yaDe88d4tPJDiC4EfGTxfgWCdzWDSxobsd0bx5XgVe6l?=
x-ms-exchange-antispam-messagedata-1: QwilEcRT1Vnl6EaeYNXzlmlx167fe/12OUM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddcdcbe-b88a-4786-71ac-08da1dbe12bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 02:25:41.8800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEfeSk+PMwAFtCjwRyrxz4a/5MPAzceg4Yiw2r6J+xhGC6weP7oWfDhMQOEHlFIdR8JOTDhMqBawgao9982L2h2RqURXGonu+yYxp5HPnM43ldcLBQeXv3eKfVPvzeKm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1714
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

> From: Krzysztof Kozlowski, Sent: Wednesday, April 13, 2022 3:27 PM
>=20
> On 13/04/2022 02:09, Yoshihiro Shimoda wrote:
> >>> +		ufs: scsi@e6860000 {
> >>
> >> Node name: ufs (it is not a SCSI device, AFAIK).
> >
> > I got it. I'll fix it.
> > (I had assumed that we should choose a node name from "2.2.2 Generic Na=
mes
> >  Recommendation" of the ePAPR v1.1 [1]. But, that's wrong. )
> >
> > [1]
> >
> https://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf
>=20
> These are examples and at the time written, I am not sure if UFS was
> considered. :) "ufs" is name of a standard, so it is a generic name.

I see :)
I understand "ufs" is a generic name.

Best regards,
Yoshihiro Shimoda

