Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E978D192ABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 15:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgCYODj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 10:03:39 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46445 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbgCYODj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 10:03:39 -0400
Received: by mail-oi1-f196.google.com with SMTP id q204so2106065oia.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2020 07:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2OHXdlNMxiUPenyVONd1GqFmOEBsd5HNZNNFX3iVKU=;
        b=N66nP8afkbQrjJ1aBKvYqGXt71+bIdTNI7PDH9wUAjYKTq18Uc5quoWo0u0gG2CQgd
         gRE/+2bi6tDojCuOigEA88n6puXBYRqa2w9CQRv9OvBadJ3/8HaI/xzBxQw0qCq5n8HG
         zVSgekhHq+LHJ5V8OR2hvvhf30QJTiD9PS7UeJva1FqftXc+o1jq/bvsj1CnlBW7LlQF
         OC8pma/1W1ZjJMdzpb2rYzTyB0G3n8wZt/hgwNd2adJIHZ+EuW8oaWGn8txSZj2UZxte
         RtnFISa4+U4aLY5pILz+vZchkAp5TFnWWypMS/D9O+i80ZXEHQjkyViDYEjaT1Pb2GcN
         fw7g==
X-Gm-Message-State: ANhLgQ03s94jcUKry7iItUFjyCekdyywllRiQH7Y8Rnhq6OTAy1yrXSd
        PyM7B8j8+c7E/konp/K7E9jZO+4rzRN4KE4u8tI=
X-Google-Smtp-Source: ADFU+vskfLCCfk0mTn1dZqQTpKKnsPAEpmxBb0oJHa5OnRXTXcfmgLFBpeNZ6N8qN77QhXAyOYZUmIo3xpQj6NrsrOU=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr2673269oie.54.1585145018458;
 Wed, 25 Mar 2020 07:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1585117470-8625-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1585117470-8625-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 15:03:26 +0100
Message-ID: <CAMuHMdUn0KuYLO+Sr-FRFYn=P41XVASa3BQOnPgaRtmXJBVwaA@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] arm64: dts: renesas: add USB2.0 device nodes for r8a77961
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
> This patch adds USB2.0 related device nodes for r8a77961 (R-Car M3-W+).
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
