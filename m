Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1AB4A33E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 16:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbfFROBv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 10:01:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43342 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729163AbfFROBv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 10:01:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id 16so13233228ljv.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 07:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r778v+MG2fc0eEIsheM8+MAALYhv36YpoZPuNIrH4/Y=;
        b=tPl4zzmDFD4wq4Pm5md8v/A189OpRedrvL4hc4YGeXmCimjGrRnaU11aVbrrvbl82G
         ZfOJNjC0E+IgxPdEjItC3q37Ob3X90DnGV0ksfy5n3dDn8EvT5VvQNhyRVF4RZvx379U
         iN/BApFSBHhJI1hDlIY390vtyZk/Ebtc7A10tpx65GodonetdMY9W/TkUzeTlhcvUhhB
         MRfTozjd9hrq/q97SLDq2FevrChtNiVuYUJMrnY1vfEt8TPu/vuwarXcu/+NS5m4Wk3P
         W63c+YObzDKj90NJ/66scM5JrVRk5PlPFoVExJhIhvCI7ClWwqnKW4H/fWO9CWCfqPAW
         iP9w==
X-Gm-Message-State: APjAAAVOArQps2L2hgtxsBxRSYAWbygCXKbdDthvXDyug27/dvAo/6hL
        FHz+H9Jd600S/gVcma4B0m2TnEbi9DOKCox1an4=
X-Google-Smtp-Source: APXvYqw/KPh/tq0XiVXfgN0Ft7a+aQRUej4suhRJLutD0W2FdERQLeun9+u/G8n4kX4kt3nl+MY6Y5CqCEUFgODwT4Y=
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr39431034ljl.21.1560866508910;
 Tue, 18 Jun 2019 07:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <156076560641.6960.5508309411424406087.sendpatchset@octo> <156076562362.6960.14055306539589207977.sendpatchset@octo>
In-Reply-To: <156076562362.6960.14055306539589207977.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 16:01:35 +0200
Message-ID: <CAMuHMdXtsmAt74ovptOQp42fqWwYe=k7Lp3LTO2Jg353jykSDg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Mon, Jun 17, 2019 at 11:59 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Since late 2017 the DT compat string "renesas,cmt-48-gen2" has not been in
> use in the upstream kernel. SoC-specific strings and the fallback string
> "rcar-gen2-cmt1" are now used in the DTSI instead.

Not really: since v4.16, which was released on Apr 1, 2018, i.e. after v4.14,
the base for the latest LTSI kernel.

Note that the removal commits were backported to v4.14-ltsi, but not to
v4.14.y.

> Remove "renesas,cmt-48-gen2" from the CMT driver.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
