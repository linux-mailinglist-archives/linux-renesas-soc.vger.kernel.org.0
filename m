Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98143F730E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2019 12:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfKKL1Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Nov 2019 06:27:24 -0500
Received: from de-deferred1.bosch-org.com ([139.15.180.216]:41340 "EHLO
        de-deferred1.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbfKKL1Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Nov 2019 06:27:24 -0500
X-Greylist: delayed 346 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Nov 2019 06:27:21 EST
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 47BT3L4q1Dz7s0;
        Mon, 11 Nov 2019 12:21:34 +0100 (CET)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 47BT3H6phlz1XLJTR;
        Mon, 11 Nov 2019 12:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
        s=key2-intmail; t=1573471292;
        bh=7XzDe+WseQSWDSgFJTn08UTHwDjcIBssslioIdVvCT4=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=sy3Zc/KtA/us8BN/04chCq6aQFGEjqMFJJAieY5/z+pPRDmppb856HfmVZOBYb0Pn
         w761ZpQ2a7V2WfK21Ekv2f2Ia75aiZb7dtYI8vbz2H66ANJCMiDrGFxNWVhPItLXLf
         nKOdYQFHgalK0vV5dDgwDLxIE/Evyv84ONmMKlPc=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 47BT3H6X9Tz496;
        Mon, 11 Nov 2019 12:21:31 +0100 (CET)
X-AuditID: 0a3aad16-3a7ff7000000385e-1d-5dc9443b6f82
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id 5B.3A.14430.B3449CD5; Mon, 11 Nov 2019 12:21:31 +0100 (CET)
Received: from FE-MBX2052.de.bosch.com (unknown [10.3.231.146])
        by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 47BT3H4VGQzC9W;
        Mon, 11 Nov 2019 12:21:31 +0100 (CET)
Received: from SGPMBX2028.APAC.bosch.com (10.187.83.45) by
 FE-MBX2052.de.bosch.com (10.3.231.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Mon, 11 Nov 2019 12:21:30 +0100
Received: from SGPMBX2024.APAC.bosch.com (10.187.83.44) by
 SGPMBX2028.APAC.bosch.com (10.187.83.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Mon, 11 Nov 2019 19:21:29 +0800
Received: from SGPMBX2024.APAC.bosch.com ([fe80::804e:b424:c437:3fff]) by
 SGPMBX2024.APAC.bosch.com ([fe80::804e:b424:c437:3fff%3]) with mapi id
 15.01.1847.003; Mon, 11 Nov 2019 19:21:29 +0800
From:   "Kalakodima Venkata Rajesh (RBEI/ECF3)" 
        <VenkataRajesh.Kalakodima@in.bosch.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>
CC:     "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "koji.matsuoka.xm@renesas.com" <koji.matsuoka.xm@renesas.com>,
        "muroya@ksk.co.jp" <muroya@ksk.co.jp>,
        "Harsha Manjula Mallikarjun (RBEI/ECF3)" 
        <Harsha.ManjulaMallikarjun@in.bosch.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Topic: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Index: AQHVg0WU8sl/jGtffUuJZcUH6VN3CqeFyP4w
Date:   Mon, 11 Nov 2019 11:21:28 +0000
Message-ID: <e731216a728c4035af88c92b70756197@in.bosch.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.206]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TaVATZxjm290kS8rKshx5pdJpU3tZVMQea+mAdfpjrTrtTMc60wFrKCuk
        hcAk4ID9Uax0CGTscPQg4RAoYKGFIlejHMYgR5hSSgkIWJBqhk7QoWoAwziFJixIfvTPzvO+
        z/s87zHfkjjztXcwqVSl8mqVIlEulhLSN+pDdka8bYkJG24MZc/9ZsHY1bZ8nLUu/iNmLzUu
        SNjZyU6MPdu6iNi+R/US9sGYDrHOkisYm5NfJWFHLpeI2Vb7PMZ2Xzfh7FTjIGJ15+j9vlxx
        5jDBGaeqENe5VE5wlpUiCVes1Yu41fFbOFdX5cQ5c7cWcb8szYi4m7o+jFv6NZ/gSpaXCM7R
        9NR71IfSN+P4ROUpXr078oQ0wal/NmV0Z3pXWwuRiWa35yJvEuhX4Gx7HspFUpKhv8PAMl8q
        EoIfERizGwkhuI/gTE2vWAgcrqDWKBGCawjGl+3IbSamj8FKX/YaEUBPYdDg/EbsJnC6n4DW
        +b1u7E8fgpxbfYQbB9CH4WHNeVzA4aAvKMfcmKCfA8dI1loNRUeAKat4zYehI2H8z761em86
        Cu5nL65hRIdA5UQBIfSSwaTtPCZsR0NVxxAu4ECw314RCfgZKKvW40J9KJS3P1if82WoqbiD
        C339wKK3EXkIDB62Bg+JwUNi8JCUI6IOBWqUYaeSwsPY8F3qWF5zOmzPro+Tk5qQ8GKCjKh6
        4KQZYSQyo1dJTB5I/ftzfwyzJTY5LiNBoUn4SJ2WyGvkwdTnd3NiGP/HaU1abJJSo1Emq8wI
        SFweQBnTXToqTpFxmlcnCzIzepIk5DIqnnw3mqHjFan8pzyfwqs32AiSlAPVsd8Sw/ip+Xg+
        /aQyMXWDlodQyMvLiwnyZDzbYqS3Ge0lfVy9uw64LChNiiJJo4xfl28V5MxGdlM6gA6SefbS
        Spy82lNWiTOEKlnFB8uoS24X2l2fkKZ6PEfwNur9CtdqgR7EptccGkMkkvtTFW6xj+uH3JwA
        qEz30fzWk5ui8EqXhv5LBv0WDOy1ONgmjoM9OxNBmXERQUfWDAH91+0EWLVaEbRZm0Xw1e8V
        YmgszJPAH5cNElipvCGFAt2MFKa1f/tAs7PFF5Y7h31h0TrrC3OrhTR0VAzQ4LTZXJ/Rcj/o
        aGhhYLrVwcCjgpv+kLtcEADWZm0QTFp+kkHZWJMMrLXzAEW1WVvhnrY6eM51W8x1W9Ngr/u2
        qYrU/7ntenZzteBMFB2w7fC+yIbvdS8O+u3udEQden429vgH9XfS6RsHy94qXHid+UI3avrs
        bkCPMvqMLTSu56jBNnJBf/FI7+DYQlLn1ZWjBy5MNN0LH04LOTb2kiEjfV9i1MSX137YfvG2
        SVTneG2lqBIbym/esqoo7TZ921VtPGIfevjCJ1eesE63v3Nix9NyQpOg2LMDV2sU/wHP+3UM
        JwUAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Please find comments below.

Best regards,

Rajesh Kv
RBEI/ECF3 =20

> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org <linux-kernel-
> owner@vger.kernel.org> On Behalf Of Jacopo Mondi
> Sent: Tuesday, October 15, 2019 4:16 PM
> To: laurent.pinchart@ideasonboard.com;
> kieran.bingham+renesas@ideasonboard.com; geert@linux-m68k.org;
> horms@verge.net.au; uli+renesas@fpond.eu; Kalakodima Venkata Rajesh
> (RBEI/ECF3) <VenkataRajesh.Kalakodima@in.bosch.com>
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>; airlied@linux.ie;
> daniel@ffwll.ch; koji.matsuoka.xm@renesas.com; muroya@ksk.co.jp; Harsha
> Manjula Mallikarjun (RBEI/ECF3) <Harsha.ManjulaMallikarjun@in.bosch.com>;
> ezequiel@collabora.com; seanpaul@chromium.org; linux-renesas-
> soc@vger.kernel.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
>=20
> References:
> A reference to the v1 cover letter, with some background on the CMM is
> available here:
> https://lkml.org/lkml/2019/6/6/583
> v2:
> https://lore.kernel.org/linux-renesas-soc/20190706140746.29132-10-
> jacopo+renesas@jmondi.org/
> v3:
> https://lore.kernel.org/linux-renesas-soc/20190825135154.11488-1-
> jacopo+renesas@jmondi.org/
> v4:
> https://lore.kernel.org/linux-renesas-soc/20190906135436.10622-1-
> jacopo+renesas@jmondi.org/
>=20
> Again, quite a consistent changelog, mostly due to the developments happe=
ned
> on Ezequiel's VOP unit following Sean's advices.
>=20
> I here implemented the same, and moved the CMM handling to the crtc being
> and enable callbacks. As a result the overall implementation results quit=
e a lot
> simplified, mostly on the CMM driver side.
>=20
> I have dropped tags and acks on the CMM driver and CMM enablement patches
> in DU crtc driver because of the number of changes.
>=20
> A more detailed change log:
>=20
> - Rebased on renesas-devel-2019-10-07-v5.4-rc4
>=20
> * Bindings/DT
> - Included Rob's comments on the yaml file license and the use of 'OneOf'
>   in the compatible property description
> - Use the bracketed style suggested by Kieran for the 'renesas,cmm' prope=
rty
>   introduced in patch 2
> - Re-order the properties in the SoC DTS files as suggested by Kieran
>=20
> * CMM/DU
> - As anticipated, moved CMM management to the crtc from the atomic commit
> tail
>   helper where it was implemented in v4
>   This allow to correctly support resume/suspend and proper ordering of t=
he
> CMM
>   enable and setup operations (enable -before- setup)
> - As a consequence the CMM driver is greatly simplified by removing the n=
eed
>   to cache the LUT table entries provided to cmm_setup() and later re-app=
ly
>   them at enable time.
> - Better support handling of disabled CMM config option by returning -ENO=
DEV
>   at cmm_init() time as suggested by Kieran.
>=20
> * Testing
> I have tested by injecting a color inversion LUT table and enabling/disab=
ling it
> every 50 displayed frames:
> https://jmondi.org/cgit/kmsxx/log/?h=3Dgamma_lut
>=20
> CMM functionalities are retained between suspend/resume cycles (tested wi=
th
> suspend-to-idle) without requiring a re-programming of the LUT tables.
>=20
> Testing with real world use cases might be beneficial. Rajesh are you sti=
ll
> interested in giving this series a spin

I have tested version v3 of CMM module with a demo application based on lib=
drm=20
library. I could successfully test setting of Gamma LUT.

Next step is to test on full featured graphics stack i.e. involving Weston =
and OpenGL.
Weston can set Gamma. I have to stop this work for a while due to other hig=
h prio activities.
I plan to resume soon.

>=20
> Laurent, Kieran, could we fast-track review of this and hopefully try to =
have it
> merged for v5.5 ?
>=20
> Thanks Ezequiel for having suggested me this solution.
>=20
> Thanks
>    j
>=20
> Jacopo Mondi (8):
>   dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
>   dt-bindings: display, renesas,du: Document cmms property
>   drm: rcar-du: Add support for CMM
>   drm: rcar-du: kms: Initialize CMM instances
>   drm: rcar-du: crtc: Control CMM operations
>   drm: rcar-du: crtc: Register GAMMA_LUT properties
>   arm64: dts: renesas: Add CMM units to Gen3 SoCs
>   drm: rcar-du: kms: Expand comment in vsps parsing routine
>=20
>  .../bindings/display/renesas,cmm.yaml         |  67 ++++++
>  .../bindings/display/renesas,du.txt           |   5 +
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi      |  39 ++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi      |  31 ++-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  31 ++-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |  21 ++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  21 ++
>  drivers/gpu/drm/rcar-du/Kconfig               |   7 +
>  drivers/gpu/drm/rcar-du/Makefile              |   1 +
>  drivers/gpu/drm/rcar-du/rcar_cmm.c            | 198 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.h            |  60 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  89 ++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c       |   5 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  82 +++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h        |   5 +
>  18 files changed, 665 insertions(+), 3 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/display/renesas,cmm.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
>=20
> --
> 2.23.0

