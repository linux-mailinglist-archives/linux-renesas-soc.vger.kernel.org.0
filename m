Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49F977176B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Aug 2023 01:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjHFX66 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Aug 2023 19:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHFX65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Aug 2023 19:58:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CCEFA;
        Sun,  6 Aug 2023 16:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH0unP7WUInZnEKueABVXT8XnxNLG+gh+8DUn+tXm4hfIm9U9mslGiTJPBuvdoXn+EEa9TyFjkFrTi9GPamqLTMSbQAmCFFr8CQdaFTRZsbNYq9MsXrFUfdn/s8S4fnKH99L8/nsoB9pT1PGb6LUQsGSqKQUgz0OAzgxh8tFVYjz2bNERBit7NC94s1tfNfWyNCjps3UbuA6fXAf2IMpxBLQvlYHD1huk/lhwGfHXIqZ0/H2mZHJ0byQScuaQhz7li0pm0kDhxhoHR+vw4yh0mBIRNZXTfgDWjllhKTyqn5dVwRTZOI+X6fWBsFV50rxelzgXJGttmrWpI57DCew8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+3NGRfokxUS57RVAAcMyUtG4cLDeQxKBsEpjRaB8e8=;
 b=J5edELlIengCmi/+rfvbJW3Z0m0FIqGk92vHtWkvlgBELdGD4gKmnf+IlM3CAs6kVIUII+ONasxItAteucDPUVD7z1iWoTliBEEwaM7O4aL1YCxWWLH7llDy/C9r6UkGJE2kcYlfXPrXMqfT1ZunSAu/tdqtipQYpIB8Ls5nO9RitUNykwdvmxWzB5dwPHZGBexOT7Dk4d5G+0ybsZMq+G6/xGEW5BmuOMVWcX11/cuVRu6u2zBpH/N45yeCKSzNtjFS8qeb60lj13fiBpfm1/yyPOODDbeKTEqJ/s1ah4S6tKFJ+vY33XK8xrOzT/BmgiXEB7KbtaPi+yekx0Ysvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+3NGRfokxUS57RVAAcMyUtG4cLDeQxKBsEpjRaB8e8=;
 b=T4qffw9Tv6pLScUm3wWGzVEmBMcxj0fM4qPA67hrkpHsszDH2E1ik5ozlKh5RM3Gt7qhgGcfqh6rSwIFp3JkmpyKZuwO5EVcw4mpGnTMy8AZ5CEciW49BiWgJ10pRIGg75j2m6SNNNKzxuzR/J3CedNGHRSxHXpNiwh4koJzwok=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYBPR01MB5502.jpnprd01.prod.outlook.com
 (2603:1096:404:801e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Sun, 6 Aug
 2023 23:58:51 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6652.026; Sun, 6 Aug 2023
 23:58:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Jakub Kicinski <kuba@kernel.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next 1/2] net: renesas: rswitch: Add runtime speed
 change support
Thread-Topic: [PATCH net-next 1/2] net: renesas: rswitch: Add runtime speed
 change support
Thread-Index: AQHZxgLySIjY37SksU+RsHq+7TLtiK/a5QAAgAMSl5A=
Date:   Sun, 6 Aug 2023 23:58:51 +0000
Message-ID: <TYBPR01MB5341907A33DB91E0C0971BF2D80FA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com>
        <20230803120621.1471440-2-yoshihiro.shimoda.uh@renesas.com>
 <20230804180232.68813359@kernel.org>
In-Reply-To: <20230804180232.68813359@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYBPR01MB5502:EE_
x-ms-office365-filtering-correlation-id: d30349ad-a200-4eb2-7dfa-08db96d9157b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dO6w7FYdoCCXQbX/uQmvDCF2C2lsfy5fjkxeREciMtlAAg+IJItOCG7LvwcA7TOoMaXzNcweu5hZFdyMeWDXcH4cSSh1jhZrEhFsftVb8PJ5PDFJgWAdJhJm9c2yJvmEzcQyZb2tmWSf+zTlEvGkcr8vxSJkw/ByNbCurFrIVc2Ct6L2AhG8wyMdPLwIqbHaFplmaE8eb1mOunqLQsb25g8MXnUsnmPkzeKylLfMNmi1ao15kLvDD+Wekqy4uFWMdnIYqPSqhzoJhMvNTNQapNg4YY9cIylo6dLd4OTe7endM1zrYlsUBo9fS9hJ3ljTJl1NFbkIUeVfbN18Paga5rrC8pYL69gO8Pug1+gzoSttkD8WhhaKhCvDRJ6oRC3czo9BeaxQ1xlSuzQ/GoOOcb1lClIRya/Oh22VTXQvIthwpPdF9TnUW8GUG+xXe6uqRG6vOcfygWcOXsaclX243Ok0u2Eggw4Nw3LP0v/GTvKSLIKJdcadnrO3wFQmU5EVDb4zKy9810D/Czvi8H1Y/ZMkMtvItSn0PJWeV3ZPHG1FELQtvE3sLF/+yM1bVlaw9V+q37HSP4a7GS/LHOygU9IWpTK77bU7+weBQI6zlAAQtJG6kwrO6lklRCWVs8RC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(1800799003)(186006)(9686003)(55016003)(6506007)(54906003)(38100700002)(5660300002)(52536014)(86362001)(38070700005)(4744005)(6916009)(4326008)(2906002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(33656002)(41300700001)(8676002)(316002)(8936002)(71200400001)(7696005)(122000001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PUcLxBv4RCMQq1wvCnRlmdXtOrIv1r9tQFs7ikg/3CxZ5jytHf1UkUQT5dGo?=
 =?us-ascii?Q?Ab8owcqACak891eq9SkZiSkKvi2M4Y2BU2aO7TSciW0/2/5hF3mdQ3t7hQwN?=
 =?us-ascii?Q?ZJht4IBh1EFNh3HoIwQu7mTuTK+qqmjh9kSXIsDI9aD9Jx+Bzteh1lPeueS3?=
 =?us-ascii?Q?CBMLJvUUDiDLEaTDMrBbfh6wHGB/vu1gHIIMo5mkO2x55J333U8+aZaBlK9q?=
 =?us-ascii?Q?F0tCuEy5feTgP8Kq1x6JGVmmeOs107PH0lT//y5s1TSQoMnTM4w/lyBGNglA?=
 =?us-ascii?Q?v/PnkrlChexxhjF5BYDnwuolklFuS+ci4YWU8Bap6u5NZX70HuxmSCC5c7xB?=
 =?us-ascii?Q?qOjxDhP1UyShWXVQemEj0PPXau/G8EMEl5gRv1ERck9MtqaQF4mVd9mghTi9?=
 =?us-ascii?Q?LZec88VkeZALa4q44kqot6chaYcDFQ6J6PdSlcI/7LGsECL7cOJRSRpyKW15?=
 =?us-ascii?Q?UPLzdHjcH2rmBxqWHmvLzA1NqD12B4nKZ6Hm6ic3yUoFOhsDKTLwoT97+R2P?=
 =?us-ascii?Q?5G3PmHmuYH8VCQOArYFQ83U9YItFtaQloWD3HVtQasNaViQTnS3eLUXSW58r?=
 =?us-ascii?Q?paWgUZvLJU13dzlooJwe75dughVV3OC798hKDnNsE6Wlof/pLINUGFOZ/qvS?=
 =?us-ascii?Q?mtAGdsZkRA0pMPMx+k10zi97mz0Zwj2JwsCzkGSvNTYfdxPKvIDkllqunSzX?=
 =?us-ascii?Q?fKy1QHMaRLbFSKzublKDEiEeCZqubbBZrlF6kVnVAG6fITw8Gtv7ltW0ay0A?=
 =?us-ascii?Q?7fb08vO/R19iEj1bcjhdOVb6P2ICQhz3WYCKVcpIdxgt8nIgzo3t/lR0cvHk?=
 =?us-ascii?Q?8oqmTXLMwy/+16OYHa5K+v6OKg/If3UTcz8gX3T0/GRXddCqiXCDyll2p9aW?=
 =?us-ascii?Q?EuJCRUb+oEEUHHHfYGnA4PDSCCTkZyKwja8PtcbYcjaGI5U84XKrIwho55VS?=
 =?us-ascii?Q?33tO8+ehVB+QDY8T2oJrGzEZqVMDtE8kurVUY7etGP6eliaB5W+tOZoc0cPd?=
 =?us-ascii?Q?kqog5lIqb/auHA012dQ0/d/qaFbfMpPVzTcuk8XIBnbNxFc975NH5N9opW7J?=
 =?us-ascii?Q?2M9/rYFH63ySkt4oJM0+eQAMOgRCczhdMyB/BYwXGAdDtGmMiQoOmKK18MkO?=
 =?us-ascii?Q?/P+UjN6k4jOgrgJKbypdfaorbFEmrjGzB5PxqsbV8GXao+DxbmU8iNvGGFR9?=
 =?us-ascii?Q?b9DR3gAyY9J5N30z2t5dXZXxkRgZIottC6dPe9Uvy70JkaadbxzterfRoBxh?=
 =?us-ascii?Q?Sart6Z6iQAKvxmeB79mMiQlGuqI7coJdZcVmZepP2cyEd93hMqcgG7O2HdEO?=
 =?us-ascii?Q?KGgIZX6wCFoHXrLDCAMQEgBT6rlZksy7lljSfUzYnmr75HasZEf00w5iMnZk?=
 =?us-ascii?Q?Vpd+fIoDapB1dwr2t6AeHhS0nUf4r18unZ+/rd40zTRjO2jY1Mc9djq21tnB?=
 =?us-ascii?Q?r0cMXRoQcB8QyhhSjPmnjCkQ0gqitvRQFPProtCPUtqRZWq6owwYDu2NYsKu?=
 =?us-ascii?Q?tW8SYb4gOxgOLOqwyDcADSN964/PFwj22AAI12nRfD0066+zlpE7F4vUXH7q?=
 =?us-ascii?Q?mcz/qBHUfUVUijyosuWb/yt3Y9I5WSIL0rDUD5MjU8JIcri9JXXBVuNwQoHv?=
 =?us-ascii?Q?1/dgBRhKEOV9+ZPLf+n8fIGfKqfth61oXAFBLEnC1zi0yXcl4kMFOSJIuT0f?=
 =?us-ascii?Q?cAcRdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30349ad-a200-4eb2-7dfa-08db96d9157b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2023 23:58:51.4923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JN9k+UCSVTDmcEEQNUfIyUq64dpYWEun6zd6kYUdPdmlu0ADCOQs4QMmuLI1QC2S7dGWCdrQmzGfj7UhGeV36YhraefdirEJctjJJcxfoNMXU1baLBa3uiOBkE3bmrlJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5502
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jakub,

> From: Jakub Kicinski, Sent: Saturday, August 5, 2023 10:03 AM
>=20
> On Thu,  3 Aug 2023 21:06:20 +0900 Yoshihiro Shimoda wrote:
> > +static const struct soc_device_attribute rswitch_soc_match[]  =3D {
>=20
> nit: maybe a better than for this table would be good?
>      To indicate what IDs it holds. E.g. rswitch_soc_no_speed_change[] ?

Thank you for your suggestion! I think so. I'll fix this name on v2.

Best regards,
Yoshihiro Shimoda

> > +	{ .soc_id =3D "r8a779f0", .revision =3D "ES1.0" },
> > +	{ /* Sentinel */ }
> > +};
> --
> pw-bot: cr
