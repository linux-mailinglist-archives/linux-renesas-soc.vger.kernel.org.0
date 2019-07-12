Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 304C06700B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 15:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfGLN1u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 09:27:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41359 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfGLN1u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:27:50 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so9427562ota.8;
        Fri, 12 Jul 2019 06:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F/AxuBHyjule2PmAV2Co3XWu6VUP6uzfm9l/yYzm/bs=;
        b=EjUWV+zqhwwbZlFafxzXtyE/1IOSr464kZUcfVWVS3RoLcPy59jnPoVmKKiWbLdPZy
         bXlZDM/USnRENZ1kY74nzn8ua3pkVs89SRmxztgbfZmsk1HRaQRynY4J4vmoGE3lUEvQ
         x0oURAS7PsdjGF3XHiybQCMGDqEKbSe9eFCDobnbGa8OyHr9SE5FZQS09p3sR3i6t4bk
         CvQ5vSKO04E3mhEDMyMO00Drqo8uqGNfs0AY9H56dqBSWLhkEKYZQTkYbtsQPV3MvGo2
         tPtPVWbdJPeGFpH+VCn7c5KoznjmyOEmCWbk/+M+s6eFjcNnqLrERa+oK4+vrkNy/FHR
         lc4A==
X-Gm-Message-State: APjAAAVLCDmGZTJZn09yAtMUeais2LHkT9GshW4tRa6WhEarxlJcqAd0
        evhPelbXtbF7C7Y4llpHVyTadXE2g35adAkZFK4=
X-Google-Smtp-Source: APXvYqydszAjoQIrWBfzwBRTDzfK4eP2hqISbF6mlZvHXJxVWboAPcYNNMTNZF6cWaAT6zWJNoLDEfZ0bfgqBNUHBl8=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr8585973otn.297.1562938069290;
 Fri, 12 Jul 2019 06:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com> <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Jul 2019 15:27:38 +0200
Message-ID: <CAMuHMdXnwXaaQi9wcqRhHbfsbWFHOWW+HaK-ePpyxc3POPVBpQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add SSIU support for sound
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 5, 2019 at 3:39 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add SSIU support to the SoC DT as the sound driver supports
> it now, and also since the sound driver can now handle
> BUSIF0-7 via SSIU remove the no longer needed "rxu" and "txu"
> properties.
>
> Based on similar work from Kuninori Morimoto and Simon Horman:
> 8d14bfa074db ("arm64: dts: renesas: r8a7796: add SSIU support for
> sound")
> 10bd03fa896e ("arm64: dts: renesas: r8a7796: remove BUSIF0 settings from
> rcar_sound,ssi")
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
