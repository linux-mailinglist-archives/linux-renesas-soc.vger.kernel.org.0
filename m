Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088C434585C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 08:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhCWHMV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 03:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhCWHLw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:11:52 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378F2C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:11:52 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id k24so10764443pgl.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Lig4AcnARc8MsgNCD5GXXxoMSCjcO/mZQ+PYuBtLVyA=;
        b=Dy5D0xgI/YJveiiUmMCWm7jcTO4sz9SAiL2npAowLfIqxFR2XJod1E9fiJBD/p/7BT
         w2x54jkctwK2qtdsq/3ywvjMe0mT6Eroir3tftSFNeHu3w6T7HEvza/hsfvzeF4CzW/Y
         CmZsKmrXd6AH7/A4xJZvT7hb/CtzgZoljYJXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Lig4AcnARc8MsgNCD5GXXxoMSCjcO/mZQ+PYuBtLVyA=;
        b=PiBc9cIYmGoAAERxARJ0JiF00YuL21YVfzchj3TfNoixamtq12orqFaSqc++D/afmS
         g+Z6cljXu76PYuozYkceyD3U9YIvah5itm9sAvJEw78CxJIOaYlK313/SQ7x9LF6dFUN
         hYWDB5onRXwTvb667yRrXC0QaOXEHdzY36mIst2oZzZdU0grdaXpRcGGFCntLltnU+xW
         h1WNS4W7QH2i9UIlVf4397LTZqyIrHwKbGaVmE3hGdQ/JgryLbBrOGvkBqJWVUFQpKrX
         EYRBOnn/14SaQpYIJ1sqB3VmqVpUYoRDuNjPY4ySpt1lNRtBarAUYvf66QNR/WLfttLp
         J0AQ==
X-Gm-Message-State: AOAM530c+b5FWOq7XJOhj9ze2YxQyrSYd5SykweGV+gcUh7AStsRtZpQ
        +dO46z+2ekEzBSwHr4MLePimvYhhD9KJgA==
X-Google-Smtp-Source: ABdhPJyksLORba9ss7v0AFBqBThHyWdSDjsRTqdFRMe/kAiRqZvRDOOMCKoPkdtYUB+T+YQ2tONtXg==
X-Received: by 2002:a62:ddd2:0:b029:1f1:533b:b1cf with SMTP id w201-20020a62ddd20000b02901f1533bb1cfmr3520349pff.56.1616483511646;
        Tue, 23 Mar 2021 00:11:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id p25sm16026892pfe.100.2021.03.23.00.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:11:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:11:49 -0700
Message-ID: <161648350988.3012082.2079519894322559104@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:21)
> The valid rates are stored in an array of 8 booleans. Replace it with a
> bitmask to save space.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
