Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F9339AFF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 03:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFDBil (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 21:38:41 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:22653
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229916AbhFDBil (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 21:38:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKEguQlOu89e9KKfuMgbE1R+yX+GcyLZAzpN9z4SZLP8/lJV0QFxQ/pEaFo9xl6k7c1FO+dNT96YyLeYzhL08S3mSBDXhGFnlbkWwyWiN77LvPA7zPrZXAui+XZm2wRHO4T7Sl9eIOURVVNL7LHJtUIkulnamSyLVfKCmCSfQI+WjCO3UPAfQL0tXYHv0BdOQ3UzV7BAUX6OYDziesaBxPA3lUMoZPmpagshbO5BqEWwttX/7PcZzhsWg2MHfV49Nu6bHSs/HqP65RN9Kf9nE545FwwVtO3dWZK/U6AJUTxzktOGxPYgX9GkSCDH9cuTtyvvr8a2ylbTHDxw9fZNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+J+SLcwp8cxsCA+OsnuKxNh6pT4M6gZNGJMpvo6eqr0=;
 b=X8FQ3uWTzulbUgttPLA6agdqVcHxuOV9fNPB6Tx3pkSmLAZehwwxSZ544OynVjra4u+IYBUyFJA2jcdbgOmx5gGDN1v07ZT2VQMev/VMFDiAsEVrcSKrtdNxZgYQjYNyJxH4VjTDdtXzyW9sfNMbjxzaosfO+TWqY7c31YkxhCbuoEmOWgFq1lfmlg61x2MWikA9UlAhoxWieU53vmMTUm01khGzbb/4J/rHYiNLfgSqyYnO8QMAMJTGWcmLH3S3QkKXq9cT6bUmScVeeyymDibqRYD/ou10rRmd1haa+X72wd1zRsdhLXE0zYYcDee1Nf4fZ5azu1jO54FEO9108A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+J+SLcwp8cxsCA+OsnuKxNh6pT4M6gZNGJMpvo6eqr0=;
 b=LLnjruwggsjMWvqBHD7xWaEY9tRYKxI3fmZ5iSXJygsWwPNK/d8VE36bRPjkVTg1U5NUCkF2/XCSW2FXqyqAsVr5siRHkwYRy0J4Xw87bAPuGwDChkkxi9L3K/Jfxv5NdwO2fgAWCq8XlTxlbH+m7kFopdTG5UELSdNlSHAjG8A=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6426.jpnprd01.prod.outlook.com (2603:1096:400:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 01:36:53 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 01:36:53 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: abort tuning when timeout detected
Thread-Topic: [PATCH] mmc: renesas_sdhi: abort tuning when timeout detected
Thread-Index: AQHXV4HC70Ta7lFqaES+3GTJWrgljqsDFIqw
Date:   Fri, 4 Jun 2021 01:36:52 +0000
Message-ID: <TY2PR01MB369247BBAEBDA4242FC393C8D83B9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210602073435.5955-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210602073435.5955-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96fc866e-b5a3-46b0-3de3-08d926f93b2c
x-ms-traffictypediagnostic: TYAPR01MB6426:
x-microsoft-antispam-prvs: <TYAPR01MB642616904996C638EDA0F052D83B9@TYAPR01MB6426.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+MnNAToS9eOjjqyALtvyrQcZbBxbiZgHQvAJNyo8H7KAGVnX2ZoSu5MoiEJWNZ+qa08PQfS5t3IkharmH3xAl8cqnEDUOtYg/NDLxYB9U/4Gck2Kvi9eUC6i7MDyLDf6IvG6n3RjJcJshRbuXuBGIQeIeT0ZDxLBOLnvNGXpv5sMo4gFM0iciQcCTaYognntWnw2YypA+jXtZmFmo9Kdnv7UK4jNpFFqLjT84eqHpeMO4TOPp/B/vYfp22D57Fq9cFV6zkgJ04TdJmPzTz2Yx8TN0d9RXbBHlb3crAECp+EtlHxUkobZhY3BJe0qr90orhhBIYRs8p5S6Pp57CudbxKYXSt6qK6vrxt49bHWyRwQ6X17wKyqB0g15koUH01L3k1Z0GryyMadDE/GlmNodCbuQzK9DB3Mgd9x+h324zbAh5rTHLxA54qREKnH5fNyYBPbCqfhrCQwkOPv/ovF6OBcNvOVtlhnJBnomT92XR+ozB+O7z8QRDAeZjtMtb7JNpqPvk/psp5O6hEfEn4ixkyVUL/qZ6nvnyqlu1+oYPvWn+IvlT87BhZdj76oJoPEGzENLQBkpOIusFkwtOX3NPk43NeyUgHM1+b93/fAys=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(83380400001)(186003)(86362001)(5660300002)(55236004)(76116006)(122000001)(26005)(66556008)(33656002)(55016002)(9686003)(71200400001)(110136005)(6506007)(8676002)(52536014)(7696005)(2906002)(66446008)(66476007)(8936002)(38100700002)(4744005)(498600001)(4326008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+heHYtnRg59YHqj/IR/VVybQn5Q8/v3AvsB7udMt2XZAs7zM1PqnPju6MxXO?=
 =?us-ascii?Q?Ny2wt0oCVU4lzkUifJ861QAjDdFEisEIUDXjg1jDOCPW4ZONXZFgR1oQ3AMt?=
 =?us-ascii?Q?YfTkPRUlQ6bOzGKhHmn1hDj/RpFrrkRhGzieykNWNpqmPpgR0r+LggdpgsbZ?=
 =?us-ascii?Q?2Y3qZsacbROvAQbb5DTImoQVklBi6XmWMY7GStdc55wxoftTQvQxmdNGpPw+?=
 =?us-ascii?Q?HPG79K5swTKc+GsnWo76d7RdsA2g06GWEe9ubfr245Y6gYA5PCZen1An03ds?=
 =?us-ascii?Q?x6AxFpjSX8fu7Vs3F2+Ue6o7rp3XYyiTw7si7EAnoolRv57sECUjt7R32Gjy?=
 =?us-ascii?Q?LnUiOWsDiSBZUIPWeouWjN6V9zSZLL20C0vLgI82H6LXfcBmLDgCmhUZkRoK?=
 =?us-ascii?Q?WT3n+ILwe+IlHF5DQi6cw2TfTqTIsalS7aOzv4Zvemb1PM0Q/g8W5pFnipON?=
 =?us-ascii?Q?W926tBcm5PzChYc4zwnwj5JgyvyKIk+oSHjCOFjVr+UI8a5DSP77+rsRM9lC?=
 =?us-ascii?Q?vcgHKVLBkguiBLkZlCN957xuznmtb1Cumhvpe939+yM+evX50EG1GowDICX1?=
 =?us-ascii?Q?bbDWhdcO87TMgIzeRAnS7NWyhbaz/KgCGC58M3gBhfaYfeq9mm45bcW7AUKx?=
 =?us-ascii?Q?/Q1cLkvqSVZD0I/eKDowHwsjTVPneMF11x2TI8qAOu6w7iWMkjWTTY1R9Gh0?=
 =?us-ascii?Q?OmS0TNKOUPqTvYGlk7fqC63k9j0ibByqNfgzaXLgZUnA5QBMxcUuMgMAHpTe?=
 =?us-ascii?Q?cHdcyUsNuaZQzAD5f7NE0yXkoHmrWBWZchQAMSX/BXkMX/uABHqEXSZGQT1Z?=
 =?us-ascii?Q?HL7p2a0qkv5fe+ye4umyU3R2RpLTfXBcWBJNoQSJJLAS2lHVRmAC/K0spWjH?=
 =?us-ascii?Q?BboatvlFvcVyhiEIf4W6VXze0crD+Ep+o2NUYIsCXw+pfYF6r8cog1VU485r?=
 =?us-ascii?Q?3ID7e3doZICmexL+jbUiKKGaQLijBO1KVZYKBcTTPOfTrDk7Zp6vgR6gX1+G?=
 =?us-ascii?Q?1GrrllL2kQIpPQ9RSrHoPIC8dmb/u6HgJcVOmnHr62B7RupTZiayb3WrYKIm?=
 =?us-ascii?Q?3aRb40GfNHe5014TflJg54rLjT2zSfkGNLZxVtBwanXDGeRV+o+CEj89CDkd?=
 =?us-ascii?Q?hX9/dH0vMPQGbU5EsjFbnQoi28EBz6JrBxBjV7+kifb288ytCR3yTpQPXfE8?=
 =?us-ascii?Q?fnCw5Cbt7w0oCCAZVWXdFtfTT0cCkGAIsy0B1sZGI7xUL65N1exI+7HYhyQY?=
 =?us-ascii?Q?qN00thssycPOEFu4+nTa2LWuWRrv49RZn98CvZNXW6Nu9APP/AKvbCwDGlB7?=
 =?us-ascii?Q?7sl5TtqibK9plnhv13GS71cR?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fc866e-b5a3-46b0-3de3-08d926f93b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 01:36:52.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7r3O6t9CrutY9jC+s32vCh++9d5VGu19Pv9FHa8QoBQwuNncEM/EQZvNTkM0Y1ZkY77o9WRI5Dqr5mk9Y1/KLajR3xMR1RFyp8kKt+BzBA4VUm75pSuZu2sWFTKiE+hZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6426
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 2, 2021 4:35 PM
>=20
> We have to bring the eMMC from sending-data state back to transfer state
> once we detected a CRC error (timeout) during tuning. So, send a stop
> command via mmc_abort_tuning().
>=20
> Fixes: 4f11997773b6 ("mmc: tmio: Add tuning support")
> Reported-by Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested this patch on my environment (r8a77951-salvator-xs),
and I confirmed this patch could send a stop command. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

