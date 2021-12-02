Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F5D46618D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Dec 2021 11:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346124AbhLBKk1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Dec 2021 05:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345449AbhLBKk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 05:40:27 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB8FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Dec 2021 02:37:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v1so113890048edx.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Dec 2021 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vN2AAkedmLiXmzlwdSTnIyWilcMSm9pwVsygK2i+Gxc=;
        b=oufe8Rc/CotXUJEXbHxoxXgUvwrKScMu8jBpMNRIviNJDH4KVY6A88yxmsJiGDddAh
         TQMYIgpebLtOLwCJfVwDe/jT03SXCTeHlKe5CsrWsEIveSCvEDP7H0cn0EELq+XJ1h2x
         UDGPwn/EEKFZS50zrAIgYHqAxfE+V0vpmzvbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vN2AAkedmLiXmzlwdSTnIyWilcMSm9pwVsygK2i+Gxc=;
        b=Mnfu5sGpL+wwbOb0XSV9btlRYYamdUuZpPwdM6rDesIglQuHH0dwnVPNT26bLopKcW
         8f1f8xtfG6RzidYUOEFIkDbJHO0lfCoR3MTOU29YVNQsIgOu9XkohG+HZb9xWNYtz0uU
         jFqj6U2yRaUNeOvulzkTiq3M76WDQIGEomQZcI/sy9dcuuIOKee7ZmWtX0iw5bL3fHNS
         ThRlhSremmBLhdrviwsCW7lzb5p+AEbkGfqPn2JGCT1Wr69dP3co+eWvnjpcp0XN2F58
         On8co3VgJddhxd3MurpTRv9T/ha6yZBPJ2rV0RnyDhK/Iqh643pbjsl56pSv3DgxcMh0
         EkRQ==
X-Gm-Message-State: AOAM530ucDtM2P6pbArHLDB+2wOczjt1zPwNMPZ4qZSPbgYyBCr3vW/i
        sC7JozdDgyEufX6exY0aEJVfrw/RbP2a0JqEqSSCdA==
X-Google-Smtp-Source: ABdhPJyCIM02ie1Bt+ERCeCMFFlxoiLkm4B+q6qF4Dhe4T7555e+J5rSdlnef3PlqEim6Lqybn00N0N5C5c8Nt8xYqk=
X-Received: by 2002:a17:907:6d28:: with SMTP id sa40mr14177388ejc.201.1638441421248;
 Thu, 02 Dec 2021 02:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20211201052406.13074-3-laurent.pinchart+renesas@ideasonboard.com> <20211201215729.2138-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20211201215729.2138-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 2 Dec 2021 16:06:50 +0530
Message-ID: <CAMty3ZBcUg8bf6MTP4QNFjDB_bx1K-Q5C2_th3M=DoKGRv0ZpA@mail.gmail.com>
Subject: Re: [PATCH v3.1 2/2] drm: rcar-du: Add R-Car DSI driver
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 2, 2021 at 3:28 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>
> The driver supports the MIPI DSI/CSI-2 TX encoder found in the R-Car V3U
> SoC. It currently supports DSI mode only.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes since v3:
>
> - Use bridge atomic ops
>
> Changes since v2:
>
> - Support probing of child DSI devices
> - Use devm_drm_of_get_bridge() helper
>
> Changes since v1:
>
> - Use U suffix for unsigned constants
> - Fix indentation in Makefile
> - Select DRM_MIPI_DSI
> - Report correct fout frequency in debug message
> - Move dsi_setup_info.err to local variable
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
