Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F39C1F123E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 06:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgFHEaV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 00:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgFHEaU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 00:30:20 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D218C08C5C3
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jun 2020 21:30:19 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id e16so13723631qtg.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Jun 2020 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=bZmtb3aLVU5KBGiqZAaqclMmQhVOzE13zZD4uF6ANrY=;
        b=gaLhUKP8dFKwFLkiRjCjiuudl522MbjPdmUimfzDCN3xnE1XdHEG6E0esOcvPDeQ9W
         Do49PqQzw0fpkjLZtP3c84sxg7kHFlVatQT5APvfHMJ/VS/jKh7khzHCcUqjjaEf5QyK
         /ASt7MgK0qf4GaCCsRWS1ge6qGcCncJuVDZvfD/xUdaESyjFAWj5umOGjBW/spz+TVFy
         UkIGyTDnnEJjGLRu/cdmVbxYcKSgR/HU3gKvvtwoURh00dxiyFSlOOXJwrgxcFOPPoJj
         evNkW/2eiAPgLD+z64pWm8y3enKoeBiR+Cm9B8kg9uNAf38m12IPO8IMRO46Yv6eqYzN
         upGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=bZmtb3aLVU5KBGiqZAaqclMmQhVOzE13zZD4uF6ANrY=;
        b=jM96HNJbRM3Ogrd333gY94K2kGmrgiBFJjhLozp0YdkG9N81I+dAXMi3suy75q0OYH
         zMeiCBt+4XpCfWubevQthlDqDbghXH0R1kEs5QzAEcBl3BnJ/wzioqksXDGTvr6Si1DZ
         TDEJDZFUY2mSEoN92Fg/UQ9uhK4VzMV+hcaSLmSVevlS9m586/njfUfbSA6M5pVwHg6a
         90S/gA/2qo0bH7v3KuesjdBJJntAer+8nKHh3UnfpcBaUwlsfbYQleuTwRxaAXc5Fa2D
         9cVIhI7GD1FzJxi+++TVzrpvyJSR1Kb8eenpSQ2/0G3pFrnR/Equo1YxoxgkZRJ31GBF
         srPQ==
X-Gm-Message-State: AOAM530GmwtX1ifJQU4Uv3+6Yy1NQV+whh40iQb18BXBNA1i06Pax9o5
        2y7oE70KhP8mvt1kctmElNyA+g==
X-Google-Smtp-Source: ABdhPJxRJE6Dl9jcPCtME9UeFyPzJdE0BYbCiwXVxxXS+YuRUIFTS2CzbpJT/kxkF6tJMislX6p2iQ==
X-Received: by 2002:ac8:688a:: with SMTP id m10mr14265007qtq.254.1591590618119;
        Sun, 07 Jun 2020 21:30:18 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id u7sm6256233qkb.7.2020.06.07.21.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2020 21:30:17 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date:   Mon, 8 Jun 2020 00:30:16 -0400
Message-Id: <1DA4E5B7-BB3A-476B-B09A-24EC89583C3D@lca.pw>
References: <20200608031622.GQ22208@pendragon.ideasonboard.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200608031622.GQ22208@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: iPhone Mail (17F80)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



> On Jun 7, 2020, at 11:16 PM, Laurent Pinchart <laurent.pinchart@ideasonboa=
rd.com> wrote:
>=20
> I forgot to mention, I think the subject line should be
>=20
> drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
>=20
> Could you please let me know if you're OK with these two small changes ?

Yes, I am fine with those.=
