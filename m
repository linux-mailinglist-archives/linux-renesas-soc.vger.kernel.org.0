Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1EE17EAC0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 09:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbjKNIwi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 03:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjKNIwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 03:52:37 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5457A4;
        Tue, 14 Nov 2023 00:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5uD3JSDo8zK3m3ObQEepoBVyLlGwEk8V1oOwUGB94Vv3ktW7MNRbRS/3IEZMff33X5hvEAuXYEflHhrBuwi6n9N/IaotN+RCPCSP/9rrZF7Z5Rlq2VBStZSwFRhZRKCVYp+IGNXoN9grHxXbnfgGGQPN1MDgEMk/oEbTGg+L3Q9NLnDwnzVCeLqbC/0gNUanGoXaY2BgK9aNDRxnCHdEaUNKrINIdy2VM/7uWPq7Q1qqkx94jfNYjl972xyWtSMCqnsNmZAgwTtoGebqAI4rOhk5mr9Wf/9wOzAA64r2pBwLv+pztpTF0lBSGOrm9GvHLylYdwZXCxHqnfgvVJXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvzcoNkDfdSOagZxFaedK6TDCC5icLrBWNsWEUvzxGk=;
 b=Ua4JvUKq7UMJU3JPEqSDGM7QI0Aj2x4ki54SoArl02xKIsGuCkJZYHkk+HCLolvfAFMlYImya6n7qC5cDJZZvkhYWWyxkg9Un0+wKuGZiaa4KyJXNQ2g3lQtRGDjpVb0nox8aEPpe8oWYo5VM+eDiLpO9H1Mtf2uzYvdXdmxkYB/nL8dIfCfGRYFmUeMMs64qND9hOH9mdTLUN7LaRPcWlXj4y+KNB5/UkfLvb/kT3/sGdeSDev8fAzo1hUSaGsxnET+3UQ8P2aywhB88v/Rkknmu0SsqeBEqeDCkpa0Eho45yMnfDYjmAvkxO692tIdaf6Ynaw5cbLAGiDIh5aMEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvzcoNkDfdSOagZxFaedK6TDCC5icLrBWNsWEUvzxGk=;
 b=nvpkuhOV9znxynixAN8wqbMAzP9RkFFNW2d5/etPgnI2m44W2F4N89HFiRaAGOQqG/8wTDwnVv2ORZJ9EKFTgl/i1hhibS+By4/K+e+3t3RdypNAXhz8ov1S6Nz5Y9zGXgXXANdGqdoQop43EHLZ3yJCgykDPlZKh2od0TdEq5Y=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSYPR01MB5479.jpnprd01.prod.outlook.com
 (2603:1096:604:87::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 08:52:30 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 08:52:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaAoALb6SIWPIxUEiZAXqbN+NjubB5qghA
Date:   Tue, 14 Nov 2023 08:52:29 +0000
Message-ID: <TYBPR01MB534172F049F8072E3F77AC25D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSYPR01MB5479:EE_
x-ms-office365-filtering-correlation-id: 45c974a3-92c2-4f12-80a5-08dbe4ef08dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+jB6P1mZv5tfSbyoXBBOODfRBxpY8hb9Yyyi5tsq99xbROGwueKVCyBVFgqS3wgBi7btu3ta1DLZGunoP8YqS0U7OoP5659g4ovaRnHuo5G6S5C/e4LRUQpEUzrSDHVk0zkkApTH8Fg4T4COBrLBSSLLhxreh/ycdjynfcGI/ndfk03CAM4L3wwcJEWPE3rHh3XMnb6S25moyX234yrf+KdM4TQ8okMPpizTOVVRLBlQyTUlP1DeqL6MJfO3ivosmJwV8KrQW4bRdgSRsbIzpbMiFN7vccQnUr2+Q0arF+v4ly+buKkPjwrdEfQi95KZvQitctDqnoOrIjQGLWEq03h56QcmsmRseoZGIh8pmS71bf3ELXkOQGCM2Qwt6myw7bUEFuQsTcRvItRodLuLG5Xp+MUapfMX9NBd6hHPKdmQoWvu83yBQmQaE4lM+Q1QkYXy+aJQzPi3SXKg0lbzqrZ1TshJ1XUsPmtx+cebihJVslfFslw64ropA55wHty9xOZmwJqYICHA3Jb+YWJbPPrmJ1bp3GflVMXxQjO0sBkvkv9wKeiEdbdsKMG2j4OHlHdO7orCR7xgCgy2TRbKuLSle57kCGiERfZ2Xt/tkGBAvsRUOzQfIDCdFXYIlNf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(136003)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(4326008)(8676002)(8936002)(52536014)(38100700002)(86362001)(41300700001)(5660300002)(2906002)(9686003)(66556008)(54906003)(66446008)(66946007)(66476007)(64756008)(33656002)(55016003)(316002)(122000001)(38070700009)(110136005)(83380400001)(76116006)(478600001)(7696005)(6506007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?02nOkC8eqQt1WtX66AMC1xwdL5u4stUGiwNwUNSUW1p0+t6A99h25EURHuel?=
 =?us-ascii?Q?mKSqUBRu9Z13x5tbWPIHMUW3fG1UFAuPzNR2e9Os83hZzT148TZclOD+uMBb?=
 =?us-ascii?Q?Pv+wu97BLqWM0Gfi+0ot5rAy4w5OCMJp+wxcT+COQ5x5Y8SZfSQSvjJAPJTQ?=
 =?us-ascii?Q?e5wQyVG/15T+7mPhXtSDWx88cmYH69tWRckbnKT7fx7NyAgxev5SwvgyfO5c?=
 =?us-ascii?Q?tDXvSnSq/sPLU6eFmaux+CGl1e30atg1Hg4yxnYKqT+6wcs2cjV5QshRo0EO?=
 =?us-ascii?Q?yi4ZsZ5P082kImti18XsEvM9EQlEm/BaYWQGODROEFxUuhPckPtklYffEVLs?=
 =?us-ascii?Q?MZNWPopAkHrcdMCbNrJJqHRom37eLHIhXiuLxn1Ccs+WXSIXtKkPtXJ1mofR?=
 =?us-ascii?Q?5MPPxuao8/gwTTCuYKGPnDTkxCjB2dEJNEBpi7nasWWQpEWoPw6a7W+9RGmP?=
 =?us-ascii?Q?2p3i1q3UqMCumjFbvwGdd4p4RyOtNEFM1BH+AfYOM5/+quQX9yQk02QSdE5M?=
 =?us-ascii?Q?ImQJfsGZMACfeH2/20yrg7B1SxHmr0QZeSP2+Vb6I0232AC26iPiv0mPUMhI?=
 =?us-ascii?Q?xTcSdoA7BtzxntUVTViQjr9p5d6h7t8rTRAF6t2/kgh7J1PzP4kxRM59G4te?=
 =?us-ascii?Q?xLm1LKEJmKm3ncwnD1xy9QbjzQ/L2uF6JdAHbwE1GA59oZQcJ08RHzO3QZMZ?=
 =?us-ascii?Q?CifO9J/xsYIynP8Z9uoE6OxIeIF2SL8zGEk/eK4JaEFJaAyorS6nkNgG2Wzu?=
 =?us-ascii?Q?7cy36hKhsaSjtmu8kX3QMoSPLHTigF7/tuG6Hge7conaXkcV23BqjSQjvvKt?=
 =?us-ascii?Q?dLNOWq31UXJyvVOUaA6BzXeTZ6u+B9S4rRuq6iWqHaRs0PNlfwoWeayTlxAB?=
 =?us-ascii?Q?B8wdg3XmTtwPC7JpZDD4kHuk6fQGyCLZ+bevVsms9BAR/czxuJR2r9iRmXRl?=
 =?us-ascii?Q?BeMQvSoTo7cdo0MpMJjVR73QhirxSXnbbLQIVxwSPNnHl36eqFG2e9bdCy2/?=
 =?us-ascii?Q?HvgKilh07njOQiwuteHq/qiMbF3ykcumJwi40wqJvcsbTDCxhGmaV2PwRdIZ?=
 =?us-ascii?Q?fM9iHokV4mPyfmPkhBZ/WDAzbks6YaEto3pNAkqAOr1lldcvC10urq41ouB1?=
 =?us-ascii?Q?RFH2g2O4thpjExbzQZlFWhXjWTZC+BAyQoVrmRVnxR9dhZY1ZQwF9kVkKFjA?=
 =?us-ascii?Q?g3uCKQGtrcXYKcDBCkmwx7uzC0C8LsizZMG5Y5W8/0oqV6kBxr1Y+LFaZ3xe?=
 =?us-ascii?Q?pXbhItX2t9zQHK2rLWGdiuseotNAmStLRPlZt1LwurmWebTYFDf/Uzcf4I00?=
 =?us-ascii?Q?ARIlG8y6TUVSiJnl6Jxx60jmjSVwu1TJJgsDgbq1MKxWsz6Z2XkIrLu2k9ry?=
 =?us-ascii?Q?+vnWN9y8d1Os7A5icm7NQiPddMwTCf9ATKtEaNmr9w2ZBq7HkL7HIAQK+0I0?=
 =?us-ascii?Q?MnS22d9jLDbW+FbeJi5RWAiIqSmh/WScwWssVAPBlDn+ivnwVu7/WpInvhO0?=
 =?us-ascii?Q?1lZh3OkCXLMwaEJqQ7s9mcY/4HTV+spcpYGVkNnEbREya4bnzixqqfpWG9Xc?=
 =?us-ascii?Q?7zCY1Vvsa/8Fi42xjt4Cd7fParBpTDmGrPrNT1m+Nm8OLxEpzlIgJS1c5chK?=
 =?us-ascii?Q?lMB4x3BGsktJT0T6pAIf+II05q/6b367x9mkr/xZJw2rKfjypt0g3G3dQ/Aw?=
 =?us-ascii?Q?fnSA8w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c974a3-92c2-4f12-80a5-08dbe4ef08dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 08:52:29.9753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PzPgfSLpfaMVaMCsOeGJnVlLxnR54mHZmSjxnfNXNZhJkJtAMofsDmzhAmg0lvZkhe8lkZa/ni3OX5rhgY83ij7t7NHmYHX7FDRMiAXcu8iUkNcjJh5u+HD40z0E0AMD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5479
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

> From: Yoshihiro Shimoda, Sent: Thursday, October 19, 2023 8:33 PM
>=20
> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
> ravb_tx_timeout_work() should calls rtnl_trylock(). Otherwise, a deadlock
> may happen in ravb_tx_timeout_work() like below:
>=20
> CPU0			CPU1
> 			ravb_tx_timeout()
> 			schedule_work()
> ...
> __dev_close_many()
> // Under rtnl lock
> ravb_close()
> cancel_work_sync()
> // Waiting
> 			ravb_tx_timeout_work()
> 			rtnl_lock()
> 			// This is possible to cause a deadlock
>=20
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Gentle ping. I confirmed that I could apply this patch on
the latest net.git / main branch.

Best regards,
Yoshihiro Shimoda

> ---
> Changes from v1:
<snip URL>
>  - Modify commit description.
>  - Use goto in a error path.
>=20
>  drivers/net/ethernet/renesas/ravb_main.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 0ef0b88b7145..300c1885e1e1 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1874,6 +1874,9 @@ static void ravb_tx_timeout_work(struct work_struct=
 *work)
>  	struct net_device *ndev =3D priv->ndev;
>  	int error;
>=20
> +	if (!rtnl_trylock())
> +		return;
> +
>  	netif_tx_stop_all_queues(ndev);
>=20
>  	/* Stop PTP Clock driver */
> @@ -1907,7 +1910,7 @@ static void ravb_tx_timeout_work(struct work_struct=
 *work)
>  		 */
>  		netdev_err(ndev, "%s: ravb_dmac_init() failed, error %d\n",
>  			   __func__, error);
> -		return;
> +		goto out_unlock;
>  	}
>  	ravb_emac_init(ndev);
>=20
> @@ -1917,6 +1920,9 @@ static void ravb_tx_timeout_work(struct work_struct=
 *work)
>  		ravb_ptp_init(ndev, priv->pdev);
>=20
>  	netif_tx_start_all_queues(ndev);
> +
> +out_unlock:
> +	rtnl_unlock();
>  }
>=20
>  /* Packet transmit function for Ethernet AVB */
> --
> 2.25.1

