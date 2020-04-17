Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BB61AD63F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 08:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgDQGlN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 02:41:13 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:34323
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728043AbgDQGlN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 02:41:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/e4oBbI+GTLOiGgyCaS6uvmdj5fZTbmdOazmEVv0bbXznWA6JsIVEngN9jkdNdkQnApuf41xW1dfCvh5oHJeptbDJ+L5HWaJu0NCTti0l5OhYVtiU2gIDOJLGqzUSXLe0SEYUY4qta7k+9e4PUDPn6xmOmFxCxCVTgRpcQjycotUu3XLqlRbIfiyX8XakUBc2Tj4Gbptwo+ukpuE1QbsNlg5ACYZob3u2TUIp7aAe/5sYpOzc7wDXUQ8IjtgDeJMQGK0xhX1sLOCGrFzgWkl33VpiNKPKfU3xkzzn/L6gguzqbAtWeK+du0ZUyGLNV8hlP070g/IL1ijEfYGu+u1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVB3Ez1IeTdUbiX8U6k/y5CKFED0oIico1bZrQmVvMc=;
 b=ThJBgxbsJcOmzS0/ht/2AavCgCGV1eIlDI5S6crue1cMQ3TB1WunyQ1/8Sc01AQ3UC7C9iMTQY5jkSu9Ke3kwcaLbbp3a7dUWj9uL2Bwqsp0JhdBIfHuKF2mYXIjUEDVxthCg3ZUmOepvoMnPpVtDfXabHrIbnHs4JZ5ITGURil7p7DduDWHuOZ3Fc58w7wTYhGQzoMRPjBkor5ZvIHoK5F+eUDFtGe4L3XEaXr6DAStPhf29Ty9pdtpZ0WyxuTmHRp9NSjaS0KElKhFOGmeAz69zAvRTnEHctsAlzIoRZSH7wXsiE/gnZMKnqsvLykwwOZINcMgPeshGi/UV1fM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVB3Ez1IeTdUbiX8U6k/y5CKFED0oIico1bZrQmVvMc=;
 b=cdwYNQ/w3DBU82kai0tQBj3xp8aHMDcLbtpYh+mZtgy++gWqCLNwEq31zn7v2UWg0lO1YARXBt2+qMSA11ZxUaZ3ZzfyvwPKTndtPgd9iUIbSexNov6ZI0E07ifmzS7McHUA+Cnc2l3f/y7NjAtKHH4DCkPBQ8gNUtcHBLfZzSU=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2061.jpnprd01.prod.outlook.com (52.133.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Fri, 17 Apr 2020 06:41:10 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 06:41:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "joro@8bytes.org" <joro@8bytes.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Thread-Topic: [PATCH v3] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Thread-Index: AQHWFHGbkNCiFGzGzkmUwf2v6w0Gfqh83RRQ
Date:   Fri, 17 Apr 2020 06:41:10 +0000
Message-ID: <TYAPR01MB4544935A912DB64603A3FCFED8D90@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1587098115-2969-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587098115-2969-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cbfc893a-9d45-4c2a-773b-08d7e29a50e2
x-ms-traffictypediagnostic: TYAPR01MB2061:
x-microsoft-antispam-prvs: <TYAPR01MB206150CE3E453C9EACFC8E1ED8D90@TYAPR01MB2061.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(4744005)(76116006)(186003)(64756008)(478600001)(71200400001)(52536014)(66446008)(86362001)(66556008)(9686003)(66946007)(66476007)(8936002)(54906003)(55236004)(2906002)(4326008)(316002)(110136005)(33656002)(7696005)(55016002)(6506007)(8676002)(81156014)(5660300002)(26005)(142933001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hd8x6RcWGl3kUjz9kO3SB4Z/RZnYOOKZYV3c418QvVtFcIBeaHmfM+NgUxYXlFubb3h7GUpNlhgnSL86xaBZc0UkUxKZD7KgLJxp5LxPKmUo06ru7xWk72y1bHOZ9dRbYvn+jixU6Shldze4Cy+FvnYB9JYgsLqLjcR1YhT8TTgMBbIBfFlZU2MRIkSofy4gWx9R+an/fDgYvQxNbTzoY533BJ0TVydUlWn+yXltpzBaGtDZsdRQjwTsSzwfGFeQgcLZn+2QPZlQ1t8FbMPgNhlCoKyfrKVlod4hdDl85JpFXW6Nv9fiP4q7K2KbceQKi8iMv/c+IBQD80dOilF1/dptWM59l323y1eskDWP1Qfj1G0NRwrmIN4RJH3hxVnruJmODcUQu93UEhRsVLpzobWb032PfW0k2WazFmgk9NldAM7ElfUz11wWscrIncV8ai3swhjyzWBQqBF5+yCi9GPxigZLxxWbzEPyx8xs5CEGWbz1pWjd+W5Ul0dXq5hL
x-ms-exchange-antispam-messagedata: /u1e04U60nWKSyZmXhwfHLubk2HMDtW97uLxuFxvPBwuY4CPzOyCXSiQJCSTh1C8NqarsObXxXz+VbR/fVQrEQThToOYNjFjVpL9pjZGxoWbcyn3fEw3n1B7mVKKBntbqeeTuy23tXGEHdv+lheLcw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfc893a-9d45-4c2a-773b-08d7e29a50e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 06:41:10.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3C8Vq+53rxKnUE5VX8RAg4QiHGltwZmEKHhMAN+UpDqKKua5Kr7chw6oM+u3BsSZ9WEBhsfY4ycvYul41yTAIsnVsGb0bWRmvNE/2BL+qWWcx8+C+qHFicsjabVErIk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2061
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,

> From: Yoshihiro Shimoda, Sent: Friday, April 17, 2020 1:35 PM
<snip>
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a73a4  # R-Mobile APE6
> +              - renesas,ipmmu-r8a7743  # RZ/G1M
> +              - renesas,ipmmu-r8a7744  # RZ/G1N
> +              - renesas,ipmmu-r8a7745  # RZ/G1E
> +              - renesas,ipmmu-r8a7790  # R-Car H2
> +              - renesas,ipmmu-r8a7791  # R-Car M2-W
> +              - renesas,ipmmu-r8a7793  # R-Car M2-N
> +              - renesas,ipmmu-r8a7794  # R-Car E2
> +              - renesas,ipmmu-r8a7795  # R-Car H3

I'm afraid but this renesas,ipmmu-r8a7795 should be the below section.
So, I'll fix it.

Best regards,
Yoshihiro Shimoda

