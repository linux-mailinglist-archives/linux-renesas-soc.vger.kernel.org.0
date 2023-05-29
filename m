Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F14C714389
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 07:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjE2FCI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 01:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbjE2FBn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 01:01:43 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20706.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::706])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3986D2123
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 May 2023 21:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqQrXXBD4pXL2qgiUYJIKcuJRui6NTgMgDtXkSFPZUd17vJIyQx8lgM57DvHfEqZit4KBrpg8dNcSVPCjuWQ6J+GJoX3X8+5rUem5Ndit+2PnxsfEAw8SKkteprsFWQ+tq0NvDLKdzbtGLmsIH0VkTMjaC8Mj9hCMa8ePPV4nrJEbeO5ag+sRpYzuiZpKZKpdddL9WztPv8hbRonyKjfwS9t0eT9Sl5Y/wGIF3TguGQq6e4uhwAXGeVRlwpRL58IxwvlVqStfglE4nIMw1SifU3WxP39ZcEHfKc9CcP3GxDW7cohZW4GKR1hKH2HoschGxKP+zcRRmVCZIgefjOO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R4nLpaTj8i7oqP+UE2tmgbuf0YZ9vBSLvI99FzX0Tk=;
 b=ZkXGWfcSr9gm1Ns4RjQRugzy2MCz5AvUo2pUW8VcTuDoeuKEoxsRT6EF2p7qcJnty0lnEYdjpSfunwV57fDFt9w/u9aj2JBQGHO/md8+DsmN5ce1No6HH0ujNZX9eidgN66I8aEi/mlP63lJZiZc1Bai2krwXuS+yfPfY6vVjWnlCkqYNIPD1sRKbjHfRyzINt0TG+TDGfdYYyPkFrEZsWfbRVbDOE0RTuo26kP3VzBo1XZf5H/L9bPqgtraIcZB1ar2rz9lT6AQPKAdWvkXEXRrSr1FBcPbQbROTQeUMCA9RL5VfOHlO7Z7WMK94vmstpJ5NCySo8AKlHDdeFWjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R4nLpaTj8i7oqP+UE2tmgbuf0YZ9vBSLvI99FzX0Tk=;
 b=XJd1XTgIgm/L4OZbVPVBgec8qT1l9USKEhcYCKEFoXjsgc9f0TxPBEXHt9AVObnBHo+58j72nGw6hF3082mwzgT16Pt5MccZtd2tj6G58jdVbpRRB2dPRiXe0thg2Q3VGc1TDAXyfbw/1Wa6wrwnHwTPZ/En0CTNIR1DxmI8niI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB11781.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 04:58:03 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%6]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 04:58:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Joerg Roedel <joro@8bytes.org>
CC:     "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] iommu/ipmmu-vmsa: Allow PCIe devices
Thread-Topic: [PATCH v2] iommu/ipmmu-vmsa: Allow PCIe devices
Thread-Index: AQHZeBigMam75OEStUaN1FttN5gn5K9mlJGAgApPVRA=
Date:   Mon, 29 May 2023 04:58:03 +0000
Message-ID: <TYBPR01MB53413708DFFFAC9CBA5B409DD84A9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230426082511.3621484-1-yoshihiro.shimoda.uh@renesas.com>
 <ZGuKp2hPnkJ6hy6B@8bytes.org>
In-Reply-To: <ZGuKp2hPnkJ6hy6B@8bytes.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB11781:EE_
x-ms-office365-filtering-correlation-id: 23d52a87-4cd0-41a8-5427-08db600148fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1626jZFUP2/0vyRJL9WzscsEcQA2fTHwRvM3OVaAmS+Ol/iq+WyC7zz9y+Zjwx7CIA8pQ0lNINximLMXUpa8z/eP+LDl/PRozVgStKSYfy/Nrc6dM1GtPLAXhVOmHD9qptx8/i0KmxftxNYIo1io6YEgkdeORtw5eeOsfDLeXj8M5lzHHCdf+8FNP5TpEYOsxrnHzKa2eUPWh5kQJeQC/F+C9hVYEb2FbBSuctsSnQe4108v2a2S5HWRtM9QzFiKzc7xpX8D4uvPvm7uRvHfwlE5SW25b3CBM4sP0mtIFKS7zShq/R/Bs5OwIAeP1B0KxakesIpRkaq34tteuVlwraOkDV3yMU1CDIiwNcIlglAHP8C2GYsg2XKK6VnrH8v6oybNpwF2CqtT40/ESgZiW622qN0V/VRFy5p+nseDOad+OrUawzXWgRwfq1kqmjRmsPk4CY7pDSs5oa1moGjRjh7dt7Zi5UTsFEEQkC/bHyWJvOO91QrXzzWKL/CrUcPDzkC4kJ29ygchTLAqeu2ief9sgYI9NDZzONzgMNRF9DeMjvc2SqAe3HPHJd6AcTcs88kB+5KMB86J0zZq+5SvZ7ZfIgRXr4LMvEBEEu+74EDHzZzZk48IQf1K3tyKnBLK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199021)(38070700005)(6506007)(9686003)(4744005)(186003)(2906002)(54906003)(478600001)(86362001)(7696005)(8936002)(8676002)(122000001)(38100700002)(41300700001)(55016003)(5660300002)(76116006)(64756008)(66446008)(66476007)(316002)(66946007)(66556008)(33656002)(71200400001)(52536014)(6916009)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O858dUti/mxddpP3cgajcyZiHELWrxVb0mZSSdBPCKuurRqxj7CcK3C49XOY?=
 =?us-ascii?Q?NT7MPi2jbkOKAXilx/q4n+lqgwNA3Yq3WGO2z9D9yPusfvr7onUb+YrOmBaY?=
 =?us-ascii?Q?nbJNKuz9lk/BYUVzrWTjIgYj5Lc71sraA3V7ifQdNf95BLqYLuz/ymTMZbQV?=
 =?us-ascii?Q?P4trKmJNAKYFn9etY5rG+HODp/lIC4Hxvf/TaMjE/s/tZ5FXLNM53Ks6F9RR?=
 =?us-ascii?Q?4hkFeNX50hpRHF5KCNQUJXuC+uBN+NaHYN7/Q+inKUx7vVr6/OTrkvCxCvXF?=
 =?us-ascii?Q?D+U8ajCPEvp0NCFDApkOfy+Q071J3nXKnvuvWxi2t86GC559nh2Kxs+PySgv?=
 =?us-ascii?Q?VOf0vbQX97TTh+xZ7+q15eHtizPoQs1XjW8MA4DBAGQhVG5RVSuq9sdYZ6hx?=
 =?us-ascii?Q?8jmowhVYUBOUmIcDmoVOQxq8B3R6tZWZlt2xZ+xhFwLlZeBcqzZezzyPpKiF?=
 =?us-ascii?Q?NBKeUbSLPzGluM7OqvV9W0Ad14UMWDx7iwOlKAmRIFsvTMEKZPOTM2Htyzgn?=
 =?us-ascii?Q?XgvE8sZfmKhe8x6aKMIecFfUzFuDdj1tmVLQtCtDgSOi5Wu4iWGdg5I8AJs3?=
 =?us-ascii?Q?OWp8VCG5je8qb0xjXOLYk/7aSxojy6VbLHwoDeu6lfuXObiyLJrAz3lbpQjx?=
 =?us-ascii?Q?MOnORGWreUMZRKB+KdGwvdIxGVhPJP5Nag4ouPSDqbl4ahyKvhX18BVC9AeH?=
 =?us-ascii?Q?q92WUP4knntskAaVWVj8CwhVibCap7GMRUWwGDrzAeeDzLJDLtlZmZBPExzt?=
 =?us-ascii?Q?/xqkYCUoBJKN5RZfqd2Ov+2PGpGb8p4w4inGMbkx9NaYq3zi3P4XkHzD8M8w?=
 =?us-ascii?Q?M0VN9OF2lRof2nwBpVzB5HtMq4zn7lJMk6aXH89tYpgq0mz9Frt/tO71B2Ia?=
 =?us-ascii?Q?lBlc39Ym9y+9CBzD6vk4HV2x4tiVe6lPM7pVNCic0xuEVoX+UEAKm8v3dbKu?=
 =?us-ascii?Q?En2iDjQ0+DtzBFt66pQTeH2oS7842t7k1ok4lXF5pxpNj6aRCc3Jb1lWfqlM?=
 =?us-ascii?Q?4TjT098EYqdHR81KnnuWzvG+SoZoSpo4I1a6euX1FuTwlCPKjPO+jql5pEKN?=
 =?us-ascii?Q?f0dnEVi+BPBAmU2E9Kzo2Xe0u7F9dDk+YpolnTenG+PxEtLDAMbEqmqLwfTQ?=
 =?us-ascii?Q?dtHwdmu+k7vP65w7ZDG9+LJdJsb5Z++MnB2HrJz6xmWY7c/jnBHEaBnG9NME?=
 =?us-ascii?Q?9371uc515eGS8TeQvUWjCD3XE8nnyK30fhS8HoRP8y2G7VJHHdFAiBIM8cHY?=
 =?us-ascii?Q?LyyHjEeO7izJqptC+7IYrIu2jj/Xpmg8tm+vdw6r9tT87CZ6ZCEpNbDXbITv?=
 =?us-ascii?Q?hcCg92pGAYD8LJXh8A3QxuZbv1WqrWA8LQutdQZtdAuers/MkncZBhJQgnHW?=
 =?us-ascii?Q?nkWz+hOP3FZ7sij9GaIgt+ZbBu6kZ46JVQWmTBSwchd2MhvfkVxZQ3RHGHfB?=
 =?us-ascii?Q?epG05RXDYrV4+K1qM8Ghp+lV94HXX9sx1zxmAW8UyJa1wdWICqgIMez0G5iK?=
 =?us-ascii?Q?pr+xEyvGgHDfclRBV1GMC7yX8HztwwjApJPLcSsuzTY12RlyNnD6//gVq01b?=
 =?us-ascii?Q?QW4kfp/k5m0iln0dLxgIMvuKIFfs+HnVtI0f+LYdbXRnUbBA2Pi02YaOX5U/?=
 =?us-ascii?Q?wTunpjQb49kJvUL+HvK8WJ9I/sxcbiI//lHQEoP5Of4EjCpZ5o43turKngte?=
 =?us-ascii?Q?rvwRkw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d52a87-4cd0-41a8-5427-08db600148fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 04:58:03.8401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+1ozGZcUk0K645cRm33N0yLdLikUeYrHqozWlQsovoVIFBWIiHaLEy9Hme/CqXsXcd8MKB9xXxMuD3ma5sRxgK+9V4UDoaElJHwHoqnQzEVCWG6B5M7OWrUNVRVk9IV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11781
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Joerg,

> From: Joerg Roedel, Sent: Tuesday, May 23, 2023 12:31 AM
>=20
> On Wed, Apr 26, 2023 at 05:25:11PM +0900, Yoshihiro Shimoda wrote:
> > To allow PCIe devices, add a new condition whether the device is
> > a PCI device or not in the ipmmu_device_is_allowed().
>=20
> This needs more explanation on why PCI devices are safe to be allowed.
> Without this context it looks just too dangerous.

Thank you for your review. I'll revise the description on v3.

Best regards,
Yoshihiro Shimoda

> Regards,
>=20
> 	Joerg
>=20

