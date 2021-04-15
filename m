Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F413605F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 11:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhDOJg6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 05:36:58 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:16654 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhDOJg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 05:36:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618479387; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=AcYvYhWDnSvlP/FehNpsHktpwLuUh7dmhSrTIw9nyb9jFppjUXbSY8L6dnCXF6AjLQ
    zhTe7uCQw4RSEcjFBclun+QnRsmW9/fKWCUcmz1yuQiexoQT12xZGOIVzvQvOQOYAFwh
    M6QRZ4oSggEKEG/NBjxT15oIB0Myxf7PZe9aLe7e+oJGnB5SSjjNeBr2vgA/LHtOZBa8
    Yb9DCwJ2ovwO+QnYONcKvK/c1EoDeG0SxXpHsro0eX+oGs8lJ5FAh4vn9mbLT61IwFbm
    10NmUXLrQMDwecgWFFQSHPAJxFfm25+kY3eSKzQifJsA5HVZfglNmt6tJR8ahLvCm/oa
    o9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618479387;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YVI4hb+693kf56OGqVINMT820htSmTp3CywWazUUS7E=;
    b=ZxZhHRKup8oQGGRb8xmEQ2e9GRYV8I+po5uf0eH6Fr14XJxf8aUMFRM6/LwzfOw061
    91GpOL2puCXNxJ9aJlfbu1mCEGjXLrPpqgzQr2Sl+oKjv9XPnaQCjSBJ+ZRO2e7GFpmX
    GZXs7tsJueutrJrK+aUHQfV7nSQsSlY6PoCEGAazxle3/8gmFipIu8Ezc7xfO60yFdJy
    YG30iiyiRgK/R9HOyGA2S3/vsSNqlEKdPC9AByAI61/qXuQbREz74GaFFSpCBM4g62Lb
    qM/Dx1EgSpsnjW9lynakttC4SBYhOfJ5+PxO/YBt0fOGKXoSinN50y26SAQZrEVI7uxt
    +DIg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1618479387;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=YVI4hb+693kf56OGqVINMT820htSmTp3CywWazUUS7E=;
    b=QpelwyxjHZCZUBCCIOPwJiME9Opwnx6jJXk4NMgHvei/aAnqNJb9vN07vcgczGn4Ew
    H3jvyLGlZZNijqaqithYa2MQOUfXVuMCnLOvcgVNMGLaaxMwExTTwh0LlIHTzRMu64rR
    O2DzE03eXiz8o4ZxZD8HGeADkMaNcTyl8HyJhLk8SwYh039JBr/+77De/7pCvbCGlPfg
    qBEt+ynC/WyV4cB4y/LuLI5HtY1a6MeB97Tru8DqrsZA431WlAWrH+KkbzbB6ayQ0OaF
    DVKuasFR3tiHH8gj+JcYCkIgM8NCm5teJBnPNnTLuK6BkY7OhJ/6cMK8A71x2SbA2WKW
    wpLA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x28jVM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.24.2 AUTH)
    with ESMTPSA id Y0bfddx3F9aR7xF
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 15 Apr 2021 11:36:27 +0200 (CEST)
Date:   Thu, 15 Apr 2021 11:36:27 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        wsa@kernel.org, geert@linux-m68k.org,
        yoshihiro.shimoda.uh@renesas.com
Message-ID: <2005486733.499552.1618479387761@webmail.strato.com>
In-Reply-To: <YHf1i00hLCd2/HVE@kroah.com>
References: <20210413084611.27242-1-uli+renesas@fpond.eu>
 <YHf1i00hLCd2/HVE@kroah.com>
Subject: Re: [PATCH] serial: sh-sci: remove obsolete latency workaround
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.4-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 04/15/2021 10:12 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> Care to resend this and cc: the other developers here?

Done. Sorry for the inconvenience.

CU
Uli
