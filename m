Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 274054F0FD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 09:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377604AbiDDHLe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 03:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377601AbiDDHLc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 03:11:32 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC1393F6;
        Mon,  4 Apr 2022 00:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ilfm1D//KjMriZQ/cdPBpr/iPNRIkra93XhuEMJeYrp/9RHgp08+iHZMJzxIbBxXTBGBvPhzk1x1yaqy2LOcJkUnApeX50hFICdQs7r3shJ9MnVFQcJ3RNnBvtGEnlzzNZF9uBGkAR1lNIHC8KxOkcD1R9CvcPhDwZ0Y9aQjaKlu1MnbGKVxvGyDQExR2Ovvazz0KElINCy4684I1mIC7dWbHYR3RFvbigDSYgc9ATmcdICcVoQLLeNJPA2uIL7yZcGUiV3QAR3TKSyCD5Os0Nuw09nBDaHxaC9tKjOYZ2oiHuHgUzgX0D1ac6c7qXPxrdUCEqFIFxuu6N4XFLlaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIqyljkiQb/dxTQJmFcFVcbomI3Uh4Uy0Lsvue8LX9g=;
 b=jqR9NZww7jTtMWTKd6ljZOw4zq+U5q18PFbXq7RTgmrPkNtDOANJHRF3nsurET3OfVdkVoAVAbn5XMCaWucwD/8V9YOpkMG6F/P49Lpigu6d5+5bStqbokLAHZ1WVYHUHBYylz59D2xbBdcJ2P0nISS05wiRJKBViR1QZEOM88xZ7PKmjDSeksOwbI0iIM23woYUuqd0ThEd0xp7tUC+GKvWheMXGy2Jc6SNlAskfvEr6EOq+1+fZBFWVGP47qDg/+F86cYHH23Jpf9a+8ecWeBrZ8/BOkqQf3fZ4qrQR+FBqfMXCyfC1QfuBGGZv21rjnhqYLuOw3IcbUyCoLpbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIqyljkiQb/dxTQJmFcFVcbomI3Uh4Uy0Lsvue8LX9g=;
 b=ko2uodcrwsW4zLA8yqAD3SSwkpqF1AkDB159XD/zPRE6uMaerU47yplANerS89MxyJIDGV77q2/By1a3il9tyKmB1lrbCBmrWYsmt4FkjauKstDOPGfv8vFIeiR2YYB/mnW8guiN01M7y7+j6cgz/5Mityr3LlqNBZQzMTcXPTk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSYPR01MB5542.jpnprd01.prod.outlook.com
 (2603:1096:604:80::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 07:09:33 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::68f2:6873:c021:1053%8]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 07:09:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to
 HS400
Thread-Topic: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to
 HS400
Thread-Index: AQHYRcZisY4LPDaQGU6Ndsqy5dkhUazfWWNQ
Date:   Mon, 4 Apr 2022 07:09:32 +0000
Message-ID: <TYBPR01MB534124CB2EC22945D75C1737D8E59@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56794556-a281-44ec-4ac8-08da160a11be
x-ms-traffictypediagnostic: OSYPR01MB5542:EE_
x-microsoft-antispam-prvs: <OSYPR01MB5542CC1E77882FC855D4D222D8E59@OSYPR01MB5542.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRNIR/m9QBgfxCMosi1FYNPCooYjH5SgrMijxqebinSTBamuqQbngnL9UyFyaeQ1126R+WsYF+rzEm+XOFHuwSaEA1aIC7nM8WT4xz3PXGGo+CX9ahzcpAW+bbxLcAlVYaqC0er7ofx7z9PnXW1KouD1PGvq5i8At/pmJPXrTIpcijkAVMC3cP8BZ5e3pY5J+H39oIfo69iegXIcmRfPNWiiE+9iYtYdiUXiDmJ919RGtflA+TmthJKOVtkI4EgVJkUxzvTWAnm/hjz95DPpLavDM+5QYrKPXCsdLsx4CSqOU724PhJBaIADkoQiyuxZF0C8DYBhTaYBDiQ1v104L9sX34JfjhUDfg+jCfSg1fGgYaB8gDBz7gKx9fdD9jDQj6hFhjrqL9xSmlwX8Q0Jaqt9bSRPEf0MVFXnCq28OzR84Zl5e75LwiXdFoKS0c9u+AQW9tnQs1PUcb6wdIKCJMhQHgO4pzt5An0f7W8iV2PyQF1Zs94Mek/Ya58BZ0wtPzaGHN22rmP6BFDi3HTNu4QF+DzYMlvMqE9wOs6YJpB6SK4LYu19+2aNH9vaKg5C0TkopRUalryMXLf5NpqWN9+jWZBThu9t/u/+Rfljvy4PyBFMVsbxwuJMvvFfJMxb15LNUtfIGPa/Y1DKrPi4L1Vn1VNr6WlWgYLhfIxFKG4AL/Tofk1Vw2d36G3CedGBPNOFyk9APsVJ+Z1KOHd7wA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6506007)(55016003)(2906002)(7696005)(66476007)(110136005)(316002)(66446008)(9686003)(66556008)(8676002)(4326008)(71200400001)(76116006)(64756008)(66946007)(5660300002)(33656002)(38070700005)(38100700002)(83380400001)(4744005)(508600001)(186003)(8936002)(86362001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SWKM6DQp7GHuzwABF0hqHR6qJqMrbseg2d6Ecjcl/wPmAK+9FfGeVu7IkFU3?=
 =?us-ascii?Q?AkSm46qOfMkbfm/7a4S/c228qvUshYLwFpS5Ti24b2EUBbzvjmQ6khjUUg12?=
 =?us-ascii?Q?soWFC4SehgefBylkH4vIBqofDkLjJyAc3qkJAvPvuY7DJIjoj8fgcMcFDUV3?=
 =?us-ascii?Q?tUSrzXScKyr0GcZ5/lB/RSP5MDuOPddNKBQLQmjSSzSYkQf5sdQ53zA9+vuM?=
 =?us-ascii?Q?uIC+n4xoIXQo9DLi23FU5zqV/EbsqsjkExXTMPzeUEE1swkcTpokzjcgahAk?=
 =?us-ascii?Q?mT+0WMbLMOaVhO2OyaxUB/9hI12p5b/voM1cVgPoBY/fqxihzEjyIL5YSZP/?=
 =?us-ascii?Q?Aevr7LFB00fuscm7dy0lTf98pOB8uXI87FeTNdud8YIZkW2GD/egDszZPUoW?=
 =?us-ascii?Q?jbm7cKAwPHQJ3vSlS1ozeBH8rYphXssC2XwscSFfuGVFGh1gO3iDjE+ACowc?=
 =?us-ascii?Q?qmvSDOKhtwU9STXryQHOI2NE0HhbRZnABwzi2O/qP8HtgMOFOE+hNj68V4HG?=
 =?us-ascii?Q?q9zQhaY+pM/WFeqb/9Gf6MBJUHKwp2uQfalWu9d19vit3Q0ATtWSrgV5Zsnh?=
 =?us-ascii?Q?2Wk3Q06U6g38tFBM600+NqQ77r6UD1gQSWA36yXlL2e47fmA6Ejz4F6HUUg3?=
 =?us-ascii?Q?eIxzEe+6ckDG2ymv33vQwhoXGi9MsTVfoBjlDPeNT8ReD1g9HDQjAWDC8o0S?=
 =?us-ascii?Q?f8EfHCOsoSov6sEI3X/AHUJGNIEF8LkDtExCQxBc1J/Lr8mcrdGe89dfhpaC?=
 =?us-ascii?Q?u8R+KUR6rxrr9TeTuFurb018kqbPL6qrDPhSdZWFkONjbu8NTqJyn1MRVw4r?=
 =?us-ascii?Q?T6RyWYDYqkpOVlr9YvFGOR4F+vDQ7poxDu/ddz8iMdjn2AfkVpQtgx4W0iuI?=
 =?us-ascii?Q?Z0UjiWLIEELYPuw7oRrrzWEBrYOstAHZ90LM+fQldWvea33E2CAhXBLfBU5l?=
 =?us-ascii?Q?waXrifPmLXhhpT0dVQBGbO3+8bkRlnvov5jfXsABwwR0ng/WZEeQMks6mKi0?=
 =?us-ascii?Q?C8nDc8tqOYLDAjvSqxlbgCUJTLECDmD7fJM5puCuUmKB40q9UzyQfZzweTWz?=
 =?us-ascii?Q?YZLbKc6QrDVNgJVoLx/ug6Ub01Sc8Mht5V3ZioBUeXtkUn+ZQKNZZjoB46qS?=
 =?us-ascii?Q?ubwSgffIbjQVsdlOELa9oBrChmhwXholJpHsIDYK84IXgvoU1dd607Jjy2RQ?=
 =?us-ascii?Q?4PXvyPmphJTe5rhR9F60xQgUCVQ5OA7FLcp2bqLnxQkIQa4ZVIC6SclsB54u?=
 =?us-ascii?Q?nQ43FsHOxagimJhSw/s/Fb+oH/QRyIfdmz5Bfyz9qoD0eXVGqn6uK9qUOxnn?=
 =?us-ascii?Q?ntmG/rytd3ufK0KBmTja+txCotn2gbYEnpE/ygJ7OLfC0cNQ1G3twW7hAjEJ?=
 =?us-ascii?Q?yeyvdIELYpmdJVWi4u18RqRX4jvqyJLKiaPp+6us9iF9ypTR4jLtMDCHqc/Q?=
 =?us-ascii?Q?6aXcKVXHGA7+v8lrCzqGU3mZyf1wyIA/DDe3Dr9n9cSvzI/CDOMTJJ2zDoYk?=
 =?us-ascii?Q?w2Y0mDbGxSDVGI1tEHawESmHTHMDWizBU3c1usFWJG+3J4pfiXJKZdhicGtu?=
 =?us-ascii?Q?RASKpUa3T61LY0hkNw+TGqR2HSP7GUpoKjgoLZF7/C4ZBYImou/jNDkwsKXS?=
 =?us-ascii?Q?CsxzqGV0qf9GNug7LsGlef62zdl5fSH3zxRjm3aIq9FY1tcpllfQ02SRNKnS?=
 =?us-ascii?Q?dagOSYw+KkFLLUpJjz9yT5PNfBuRY3XoTgSe5AmkGC5TY5WFKs/Bvxul+ik1?=
 =?us-ascii?Q?s4c31SfgSZd7AAV1Fdh/HfCsx/aAQi5/8ctvL6zQOoJE4zZGayy8d3HPedFE?=
x-ms-exchange-antispam-messagedata-1: /2oJ85nudbnQONAn2SIkliyfDt2T6j3ObvQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56794556-a281-44ec-4ac8-08da160a11be
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 07:09:32.8511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKHZkFpalmc+zGopByPX5CdycCMYnW37SzzzkjaPNjFSrIOANFGpBgFhJKJFUd+Q+vaqmeSzmLF2sfFmujx4+yIXt5tEwJAL522tsL4TJesFuO+4BNJz3hF/EJP8tP9k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5542
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Friday, April 1, 2022 9:45 PM
>=20
> Previous doucmentation was vague, so we included SDR104 for slow SDnH

s/doucmentation/documentation/

> clock settings. It turns out now, that it is only needed for HS400.
>=20
> Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock han=
dling")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

After fixed the typo,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

