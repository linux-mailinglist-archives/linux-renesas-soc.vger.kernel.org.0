Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4673F31F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 16:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbfKGPGj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 10:06:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:32916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfKGPGi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 10:06:38 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3ACFB21882;
        Thu,  7 Nov 2019 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573139198;
        bh=fsUDid5HKrc9F/WdJDG0G0BJvA0zDxAtYlHrMV4oMlU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=H0ouccmx3hPoSmfABuj+ASPlZjcT34bKeeTs6W7khhPV0gKKHXHX/84pH9urmXIqn
         8k0RkS0fIKYPO330bAf7gr/wNnO6IOIHTgXxFB3dxquRjLgr5y5YnQZNpmqf1g0HYg
         Ehg0WoF9J6m6pe7goKXBRjfM8Xk5R/3CDtnxQvxE=
Received: by mail-qt1-f171.google.com with SMTP id o11so2681125qtr.11;
        Thu, 07 Nov 2019 07:06:38 -0800 (PST)
X-Gm-Message-State: APjAAAUshMS+RDZRZupsDj1c3V6bkiY6FHyFhk7C/QFTQIo7tHuMl8A/
        p7UGbhxXX7bnq/gAGUC6htNGgS0jIpIkub7szQ==
X-Google-Smtp-Source: APXvYqyWThPesgEWjPQEctkib9uu1yXYL3S5Ba/sok9ZNmOi20dTHR/4ibL7EeEbmf+MSrIGI5rbVM+ND/yHu3273d8=
X-Received: by 2002:ac8:7612:: with SMTP id t18mr4267565qtq.143.1573139197437;
 Thu, 07 Nov 2019 07:06:37 -0800 (PST)
MIME-Version: 1.0
References: <1573102944-11095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1573102944-11095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 7 Nov 2019 09:06:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJT-k98xtsxAK+jZ1Jhwz=SmpGDR3hUiN9tcOQZBACXTw@mail.gmail.com>
Message-ID: <CAL_JsqJT-k98xtsxAK+jZ1Jhwz=SmpGDR3hUiN9tcOQZBACXTw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: usb: renesas_usbhs: convert bindings to json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 6, 2019 at 11:02 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Convert Renesas USBHS (HS-USB) controller bindings documentation
> to json-schema.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v2:
>  - Fix dma-names and dr_mode.
>  https://patchwork.kernel.org/patch/11229977/
>
>  Changes from v1:
>  - Remove enum from RZ/A[12] compatibles.
>  - Remove comments from reg and clocks.
>  - Change maxItems from 2 to 3 on clocks for USB 2.0 clock selector.
>  - Add items on clocks.
>  - Remove $ref from a gpio property.
>  - Add maxItems on phys, phy-names and resets.
>  - Remove generic.txt file reference.
>  - Remove the last blank line.
>  https://patchwork.kernel.org/patch/11205919/
>
>  .../devicetree/bindings/usb/renesas,usbhs.txt      |  58 ----------
>  .../devicetree/bindings/usb/renesas,usbhs.yaml     | 126 +++++++++++++++++++++
>  2 files changed, 126 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/renesas,usbhs.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
