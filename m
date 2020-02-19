Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52E03164228
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 11:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgBSKa7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 05:30:59 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33297 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgBSKa7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 05:30:59 -0500
Received: by mail-oi1-f196.google.com with SMTP id q81so23352526oig.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2020 02:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvkhkBjXP3xwonKXIkY4RihP08iRrqR721UJBkfJeTA=;
        b=af9sfEpZrdGl9JSN4wha1hfb7EwRfRPWJs9pShq/x92IWD4rwOFrp1Lx+xQeu3k9GF
         fFNjL1jmF/hf7hLIqP1fRZ4DjkIadkSjIka9BrlVanJYCPrcLryJKD0yirLja/dyRxeD
         RoyK63SXdNmZZPOb9h0qyW2+ad8Q64Gikx21iAcKUQr0tSt375NOPco5m+dysreNERIR
         UzkmXJ8nUBQGaZGCnGX4iOkf+dQqrfL4ORmHtfkxdWs9EcJd517FSriqLKWrENL+WB8I
         k7Y4xiVLC1gIlHv2zyXSCH46lAqjklLeZsd9H6pGlePGQjAMRhYwJb7LhZ4rbvFc0iLA
         hruQ==
X-Gm-Message-State: APjAAAVvyLjfzsIlB0ku5+SRG1Urkpu+Dah54iK7xBHdYlxbKK+CaTx0
        827r9oE92wJ5z0wpu/XCEVJ2yu2tIFkI3soTDBY=
X-Google-Smtp-Source: APXvYqyiFJRzLPKkcTXbZ92ixD2SB2MQqGjOS7f+m696AuxASfdlt+S3DyBRmMwQmUieZHK69GTMDoaWwBRuatifNi0=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr4226894oif.54.1582108258523;
 Wed, 19 Feb 2020 02:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch> <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
In-Reply-To: <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 11:30:47 +0100
Message-ID: <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup call
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> It's right above the drm_dev_put().
>
> Aside: Another driver with a bit much devm_kzalloc, which should
> probably use drmm_kzalloc instead ...

What's drmm_kzalloc()?
The only references I can find are in this patch series.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
