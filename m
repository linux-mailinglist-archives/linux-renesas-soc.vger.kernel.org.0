Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D704D192ABD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 15:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgCYOFW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 10:05:22 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42830 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgCYOFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 10:05:22 -0400
Received: by mail-oi1-f195.google.com with SMTP id e4so2132035oig.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2020 07:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LX/NbwdP4j07uCDYTJAlkKSPh+sDSHQC66EYfW8cCWo=;
        b=sMlDJESpkRR9eHObw18M4COsAA4nA9sKucRvk8b38QRnZnmOP6sh2FtgkGdaVqlHib
         zX5sSJIUdzQK4SB4Z8KrZ+UkZOvIaJEg59tVygEjg+IMwaSi0EOOM/ER+IKPI2es9dUa
         JO+0PmUjmqYb8a3qC8JS1PXo74IWMJ9ET4h16nevsED/afIfhmUDoTYRFbLGnPwnZkmD
         uA/iPdCxEqNnETyj8ziBfrZSuBCmkcPIUov6YrWQbuGqfJUJp9joZwPVZMaN4k9IM3RY
         huDay8QUmNUSISENsDVRZCsGatVw39AWBF7oXixf14z4diWmtUaoURJ0cwpU+T67940K
         1cjg==
X-Gm-Message-State: ANhLgQ26owRecggSt4CCeJWa5837Ihi21f1dvLYB5f3sBL+lCC+hDhCS
        syyVQFIdgm/bhixjisAGgucOJ06cBerTOYjMsS4=
X-Google-Smtp-Source: ADFU+vsVc+UR8q5kz1HaF0aLpvgXnF+R9RKxzIVllE30sqhI1SXqLxQfylRYP5iheaWJ0Anr9o5yLjVm/mb75Q3b2K0=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr2428980oig.153.1585145120458;
 Wed, 25 Mar 2020 07:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117470-8625-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117470-8625-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 15:05:09 +0100
Message-ID: <CAMuHMdXrwDm0ZdkZRNfnmxLJbq-ETf0_TdgjO3bfT=GG_pjJnA@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: add USB3.0 device nodes for r8a77961
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 25, 2020 at 7:24 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds USB3.0 related device nodes for r8a77961 (R-Car M3-W+).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
