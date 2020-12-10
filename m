Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0E32D6B0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 00:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394152AbgLJWbV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 17:31:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405112AbgLJWY2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:24:28 -0500
X-Gm-Message-State: AOAM5310btKfkR4EQduLIsF0fq7uSQPn5j+ZyPkxhf3q7iranS0dwZNo
        Izts3Qiu7UXG8rwWEyuC6Gd258sn7cNlqNoRDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607638694;
        bh=EpQXZPzZxNzoRGqI4ddm2b64T2je5swcaUnOdnWBkpQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NSXYFjo/MSgNNT/OC9kNgQcPLF/S2EHB2nUSLqeGB364tH1YcSB3m4Q5152qNccFm
         N8PiPdpuoEF66qnXsxRjA9exa8rRZ4O2kVNGF3pufYpOGblvsLlffF/Q5/jj6HE/yT
         w9ENC8wVNEF/EDZYkSAv9NMBfTwn0TU2J/lP1vB1idybYA9RuVMzenX/HqO7dRk65B
         2TOnVhXfQnLUJxcqnib+rWnV7xOSY7B29XQBWhYWxDRlXhjwtTH6JvHziaVqxWzmae
         IKkg2AG6naHvrYE95Sko9mrDLJ5MPMwWBNDuhJw6w4qwqcvPRjCnssByRVSwQ4GUAA
         YYzmSn+mzxlAQ==
X-Google-Smtp-Source: ABdhPJxMw5GrYX7DqQWbE2vDgE+zCKzx/WKgEXtPSwwP79L7U+t9vm/eWzbHQuxPW0Z/1SVHxP1H5z7RMlOb8YUNic0=
X-Received: by 2002:a50:ab47:: with SMTP id t7mr9135830edc.289.1607638692393;
 Thu, 10 Dec 2020 14:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20201209195624.804759-1-niklas.soderlund+renesas@ragnatech.se> <CAMuHMdUgo+4LyxBX-N+L5wWb9AGyOkVuAdm5RkTeQN5oCukF6A@mail.gmail.com>
In-Reply-To: <CAMuHMdUgo+4LyxBX-N+L5wWb9AGyOkVuAdm5RkTeQN5oCukF6A@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 10 Dec 2020 16:18:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKzCsOgYc9u9nUsqJU8E-PJGLBNrsyTT3ODawi94Z7Xmg@mail.gmail.com>
Message-ID: <CAL_JsqKzCsOgYc9u9nUsqJU8E-PJGLBNrsyTT3ODawi94Z7Xmg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document missing Gen3 SoCs
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 6:44 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> On Wed, Dec 9, 2020 at 8:56 PM Niklas S=C3=B6derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add missing bindings for Gen3 SoCs.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

You're going to need to resend to Daniel. I'm assuming he'll apply it.
I could, but I can't really keep track if there are other changes.

Rob
