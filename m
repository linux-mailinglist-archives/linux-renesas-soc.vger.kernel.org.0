Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A228717C42A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 18:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgCFRUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 12:20:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:33214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727125AbgCFRUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 12:20:39 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583515239;
        bh=BCmkdV8nU0jJ4fhxQHky29TuhE3+knohFRt7uSlKpl4=;
        h=Subject:From:Date:To:From;
        b=a4rYbAEEFz05SNMEBhYk4xBBZWVxumhUUiT4HXzuzU/2iuNACr85M28aOJuAsnnDi
         tGIJeyHo3/rNCeqGSMntIPNyZ9x86hUUqX+chJIGKQXwimG3I5NunCVla2l0DJ1w+w
         PWXZ/avW1JjmE5MnypsTuzQyxU8KypztM4m6XasI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158351523937.9911.13382682454148503565.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 06 Mar 2020 17:20:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU (2020-03-06T17:15:01)
  Superseding: [v1] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU (2020-03-06T03:17:49):
    [RFC] drm: rcar-du: make all sub-symbols depend on DRM_RCAR_DU


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
