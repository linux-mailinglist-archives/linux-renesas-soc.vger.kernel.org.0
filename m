Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 368EC4174A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 23:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436678AbfFKVzk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 17:55:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436639AbfFKVzk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 17:55:40 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8283421743;
        Tue, 11 Jun 2019 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560290139;
        bh=itIrCS6UbTV7i7K3wPxZGlSZjFZxEj/zzkrOrU7kDbE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0YVLQIaJohTAJMUCpWkwKmry/FYPTYij9dQAo1PIgk59uxattW8S8o23zjexP+Gg2
         fLAVLoCTEuIPNY8aGuLS+8nhczmPT3j0UpW7oV6e2k041jQuPTr/L1w46a2ywjlHTZ
         ByHHgwg3flMwc0Muy0MB3T4bGwue9ZbH4mbhAWhc=
Received: by mail-qt1-f175.google.com with SMTP id h21so16441100qtn.13;
        Tue, 11 Jun 2019 14:55:39 -0700 (PDT)
X-Gm-Message-State: APjAAAW9vr0rMYRXq//nPIf+xH3V6Db30MtsDf/93NIa9nYQInXc9hy0
        sAynVBAyNKzpEweM0QFLdOez7D6ojhM5ITtWdA==
X-Google-Smtp-Source: APXvYqyPv2VyEFqCE2QAk64mlMkmylSJOYK8O4iYnfSvP7YJGPQu05IvaNFHAswddNfsGOXMpuSEIcRcFCpAUrmLIZk=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr18151680qvu.138.1560290138676;
 Tue, 11 Jun 2019 14:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com> <1559296800-5610-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1559296800-5610-2-git-send-email-biju.das@bp.renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 11 Jun 2019 15:55:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLvmxAt1ahaS3XAoqwR2F_eAosce-jhF74_bZuefdYybA@mail.gmail.com>
Message-ID: <CAL_JsqLvmxAt1ahaS3XAoqwR2F_eAosce-jhF74_bZuefdYybA@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: usb: hd3ss3220 device tree binding document
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 31, 2019 at 4:07 AM Biju Das <biju.das@bp.renesas.com> wrote:
>
> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v6-->V7
>    * Removed Rob's reviewed by tag, since there is a rework
>    * Incorporated Sergie and Shimoda-San's review comment
>      (https://patchwork.kernel.org/patch/10944629/)
> V5-->V6
>   * No change.
> V4-->V5
>   * No Change.
> V3-->V4
>   * No Change.
> V2-->V3
>   * Added Rob's Reviewed by tag.
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

Reviewed-by: Rob Herring <robh@kernel.org>
