Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7504E48AF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 19:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfFQR6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 13:58:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34935 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728564AbfFQR6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 13:58:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id c6so351588wml.0;
        Mon, 17 Jun 2019 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
        b=iir/cwro3Uo0pydX2p6MssHcUcKCWLi3F0aRNfT9oiuPoCu3KzQi3D++TfCMCA5kbq
         UhdVsSno+MyWwqU7UMla2YRrjl3vooBFlx0nKtYTh44mvlxTjTeU/ZMsoTFT3Na0Nbo8
         zbXVWPc9pfLCEz8akgJpe2z9seqCP2z2haWgAfsi9/bgn50zH7bOZc5jW9vXW8SMk4Rt
         tx2lTCVIciiKlEe6uGemUYOgLdxEayja9E1N+noF29tOg7VjKlKwytO7pxFuV7oS4QEN
         rJlpCllgKrwVj7eJfedrwSjRfOJSjzakYsBlPrwpP8+Cypssx+Hl6JwcIa7W9QWRzmBt
         BA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RA99XH++ZeHo9lFJDfpQ1th6xBYVyCVIO6aT2ccvLfQ=;
        b=DCGnKi4bh/i7N18dukr0h5GrOPxayUkr5Eaa/GezQM3lXq6m926Ous4Y2+Zc8TNW1C
         bDftOe0KuqoauxRY8v0izGsPtoZoY2NOwjjah0DpzURbmgmbMqmi1PPBnXLykO0WywCF
         k4CHJ4KAptYMqawclTTklG06/dEsjQzmSxVclzkDtauMFTKl+1d+AAMzjfssBg71nZdU
         ejwM3BJZXarygvyYm7vKpI2P2gN09hERsJOD8ZM0IcDKOeujk0/LOLO7aJiKb32+RbgV
         zg01Cm5IqmNdAGYUEK0g1tWBKhCyOa1gqQcdKJFDh17q7Uw9QtHqwLcOlKFM0okJyhiz
         Y0uA==
X-Gm-Message-State: APjAAAV/II8C/5PTvRr4LJSTuCrIlEzV8B/k/38nhqf1XLTlV1OQrXUy
        nN78oGbx2NYcOQG+U/M4OBA=
X-Google-Smtp-Source: APXvYqxzwMRI3pC9nLxx+cmi8fX06IrtlUhdDEcmz2BcTfXpaVk8v0SGvmPS+vZF06+nGUJcsaBAYg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr21050453wmd.116.1560794289646;
        Mon, 17 Jun 2019 10:58:09 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
        by smtp.gmail.com with ESMTPSA id s188sm13333537wmf.40.2019.06.17.10.58.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 10:58:08 -0700 (PDT)
Date:   Mon, 17 Jun 2019 18:56:06 +0100
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        spice-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        etnaviv@lists.freedesktop.org, xen-devel@lists.xenproject.org,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/59] drm/prime: Actually remove DRIVER_PRIME everywhere
Message-ID: <20190617175606.GE26766@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019/06/14, Daniel Vetter wrote:
> Split out to make the functional changes stick out more.
> 
Since this patch flew-by, as standalone one (intentionally or not) I'd
add, anything vaguely like:

"Core users of DRIVER_PRIME were removed from core with prior patches."

HTH
Emil
