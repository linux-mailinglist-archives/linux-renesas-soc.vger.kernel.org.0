Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67991F116F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 04:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgFHCor (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 22:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728369AbgFHCoq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 22:44:46 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF27C08C5C4
        for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jun 2020 19:44:46 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i16so13567993qtr.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Jun 2020 19:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=FPcz9YafDq1qtXpcZdMPyDLn3kmPXd/6a/ka09XlD6g=;
        b=DbxjgyYPgy+83sEuMM05Ktn+rvL5Sxf9DeHbRxI70b9NTCky2nkoxmnw8LMpSZRt0W
         IjRj5UPV2SfCKZAUXT4NdGo7BT0ivf7MaQA9st1D+6JZnlfWGjIKG/+D3znOsI+ki9x5
         3mUe05daFekaxRjD70QCHU66MwocIMKru9Ci8qG1HbRn4Cy5dJh1rGy1F8uBuETFB3ro
         OPA/KoHHoFjZOMMc7RLDZigkn6vx9i8StX+DbK/LF9wxj3uOlFBJPrC9ynVBSjwhibTR
         TH3CVhFBo10HWh/hzrBbkv3VAOqfbNHoUulbVW/0B+psz+JBIhbYO3FmgHP1VETJOe0N
         G5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=FPcz9YafDq1qtXpcZdMPyDLn3kmPXd/6a/ka09XlD6g=;
        b=S/AtXib9NydagVb3v+Gge7wM8lSFC+RwTOn843bOSOi/cnet7eNb7nfYYF0FePFHSc
         hfAabKArOi/FezGxp2m6sLpADzmNBNUQjZ2osg+SZCkmMsF2nx2+2+j5O7TDPLgyVZcW
         mSusAX5RVWL4wxOtB7w9c7c7yPU/ymmBotVoAPiPf+2Zy05MTiAr52mDGIll02H6lndf
         T6wGf+1r7q/rS27vDs2n58mn0UATIGmkzeUbxPHbvj+mC5SMiEUX2yggoxYWaUq/AoNZ
         OkEqmiWXyBhukZjgdVsbgPZMBG3kDQfQYpCuMfUpchBDLbyr7Q0Cjs8jlFFRtTmr0xBM
         qLrg==
X-Gm-Message-State: AOAM532w7jGhvzSBePHy7byuRe8SFI7BgRmB8fOTxQy4famsCa29uj6z
        KnTC7lH+iH320C91IEgIFyVkOw==
X-Google-Smtp-Source: ABdhPJzOnZMvbGJtixH027fSNPWPdCNG4SDNPkiojoKUt328YLGmo8Pyvi+u4Qv8XubOIu8igVkRGA==
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr21871617qtv.38.1591584285211;
        Sun, 07 Jun 2020 19:44:45 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id v189sm5973771qkb.64.2020.06.07.19.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2020 19:44:44 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Date:   Sun, 7 Jun 2020 22:44:43 -0400
Message-Id: <4E18C3DC-D418-4DEB-AC70-4FB6FCFDB5BD@lca.pw>
References: <20200608020207.GL22208@pendragon.ideasonboard.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200608020207.GL22208@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: iPhone Mail (17F80)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



> On Jun 7, 2020, at 10:02 PM, Laurent Pinchart <laurent.pinchart@ideasonboa=
rd.com> wrote:
>=20
> How about depending on DRM_RCAR_DU instead, as DRM_RCAR_WRITEBACK is
> used to select compilation of rcar_du_writeback.c that is part of the
> rcar-du driver ?

Sure. I=E2=80=99ll send a v2.=
