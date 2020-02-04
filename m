Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A23151F9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 18:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgBDRjq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 12:39:46 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37875 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgBDRjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 12:39:45 -0500
Received: by mail-ot1-f66.google.com with SMTP id d3so17921110otp.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Feb 2020 09:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MfTrfXuWJZvmTinqgH9BhTb81pXVw324bWiLHoptFMQ=;
        b=hXXHFdJwa3nh7sHSpNINgUoVYU+1fSPa36YgpH5Io8lzxHdjQb+Q9xwn2q5vLF4dE3
         npY3gaa8iS5QA2ee1VXEXxqp02iejpr3bblUm840FGrtXPJtmvYsiHjxtOFikgslSFOC
         y/kGsWLCgRJQSkuSkEWvVU37+QunLR1Yq7538maHAerp+9rL4RUuAfeXwqE8+ZEkIEeb
         uct8SRENel8R4jdu7Guz2UdGsnpm/xNChCudTFca0tsV/Riu/l5E/UFzggHqvXRw7Hhv
         0N1mVI1IPgLJZrko8jsBPBv6gJzmGwwZiLZkTA6N2rQ0FwDopp5+w+C7wRRLM1DV/B58
         9JMQ==
X-Gm-Message-State: APjAAAUPix9MKj9eev9s3UDv0dFEBOXansP4qe0NiW4j/Nf/5SUrT1Fd
        MIZGKzXLPYs1+Il9zNyaYf9EfdSwmVSE/mChRXM=
X-Google-Smtp-Source: APXvYqx9f9SWF/55QKPhce0GISuI6/YtUC2HQmARzMxBnJbY401BCGr8IO8WU8RPHjBLF8lwNuxC9qnjvMaHP0VxhZE=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr23636696otm.297.1580837985305;
 Tue, 04 Feb 2020 09:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Feb 2020 18:39:34 +0100
Message-ID: <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Replace with appropriate types.h.

Thanks for your patch!

I have only one very short question: why?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
